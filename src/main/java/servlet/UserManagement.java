package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.crypto.bcrypt.BCrypt;

import beans.Address;
import beans.Address_type;
import beans.Role;
import beans.User;
import dao.AddressDao;
import dao.Address_typeDao;
import dao.RoleDao;
import dao.UserDao;

/**
 * Servlet implementation class UserManagement
 */
@WebServlet("/user-management")
public class UserManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserManagement() {
		super();
		// TODO Auto-generated constructor stub
	}

	UserDao userDao = new UserDao();
	Address_typeDao addressTypeDao = new Address_typeDao();
	AddressDao addressDao = new AddressDao();
	RoleDao roleDao = new RoleDao();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action="add";
		User user=null;
		ArrayList<Address> adresses = new ArrayList<>();
		
		if (request.getParameter("id")!=null) {
			action="update";
			user = userDao.findById(Integer.parseInt(request.getParameter("id")));
			adresses = addressDao.readById(user.getId());
			
		}
		
		ArrayList<Address> deliveryAddresses = new ArrayList<>();
		ArrayList<Role> roles = roleDao.read();
		ArrayList<String> genders = userDao.getGenders();
		Address billingAddress = null;

		// Tri des adresses en fonction du type
		for (Address address : adresses) {
			if (address.getAddress_type().getType().equals("facturation")) {
				billingAddress = address;
			} else if (address.getAddress_type().getType().equals("livraison")) {
				deliveryAddresses.add(address);
			}

		}
		
		request.setAttribute("genders", genders);
		request.setAttribute("roles", roles);
		request.setAttribute("action", action);

		if (action.equals("add")) {
			request.setAttribute("deliveryAdresses", new ArrayList<Address>());
		} else if (action.equals("update")) {
			request.setAttribute("delivery_addresses", deliveryAddresses);
			request.setAttribute("user", user);
			request.setAttribute("billing_address", billingAddress);
		}

		request.getRequestDispatcher("/view/backOffice/userManagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("user_id");
		String billingAddressid = request.getParameter("billing_adress_id");
		String deliveryAddressid = request.getParameter("delivery_adress_id");
		String role_selected = request.getParameter("role");
		String gender = request.getParameter("gender");
		String lastName = request.getParameter("last_name");
		String firstName = request.getParameter("first_name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone_number");
		String password = request.getParameter("password");
		String PasswordR = request.getParameter("PasswordR");
		String billingAddress = request.getParameter("billing_address");
		String billingZipCode = request.getParameter("billing_zip_code");
		String deliveryZipCode = request.getParameter("delivery_zip_code");
		String billingCity = request.getParameter("billing_city");
		String deliveryAddress = request.getParameter("delivery_address");
		String deliveryCity = request.getParameter("delivery_city");

		Address_type billingAddressType = addressTypeDao.findByName("facturation");
		Address_type deliveryAddressType = addressTypeDao.findByName("livraison");

		/*************************
		 * gestion des erreurs et controle de saisie
		 ***************************/
		if (!password.equals(PasswordR)) {
			request.setAttribute("error1", "Les mots de passe ne correspondent pas");
			doGet(request, response);
		}
		if (role_selected.equals("Sélectionner un rôle") && gender.equals("Sélectionner une civilité")) {
			request.setAttribute("error", "Veuillez choisir un rôle et une civilité!!");
			doGet(request, response);
		} else if (role_selected.equals("Sélectionner un rôle")) {
			request.setAttribute("error", "Veuillez choisir un rôle !!");
			doGet(request, response);
		} else if (gender.equals("Sélectionner une civilité")) {
			request.setAttribute("error", "Veuillez choisir une civilité !!");
			doGet(request, response);
		}

		/***************************************************************************/

		/*************************** création du user ****************************/
		Role role = new Role();
		role.setId(Integer.parseInt(role_selected));
		User user = new User(lastName, firstName, email, BCrypt.hashpw(password, BCrypt.gensalt()), role);
		user.setGender(gender);
		user.setPhone(phone);

		if (userId.equals("")) {
			if (!userDao.create(user)) {
				request.setAttribute("error2",
						"L'utilisateur n'a pas été ajouté. Essayer de changer d'adresse E-mail.");
				doGet(request, response);
			}
		} else {
			user.setId(Integer.parseInt(userId));
			if (!userDao.update(user)) {
				request.setAttribute("error2",
						"L'utilisateur n'a pas été modifié.");
				doGet(request, response);
			}
		}

		/***************************************************************************/

		/************************ création des adresses ************************/

		// On récupère le user fraîchement injecté dnas la base de données
		// pour avoir son id pour l'utiliser dans les adresses
		User userFromDB = userDao.findByEmail(email);
		

		if (!billingAddress.equals("")) {
			int billingZip = Integer.parseInt(billingZipCode);
			Address billingAddressObject = new Address(billingAddress, billingZip, billingCity, userFromDB,
					billingAddressType);
			if (billingAddressid.equals("")) {
				System.out.println("Je suis dans la creation l'addresse de facturation");
				if (!addressDao.create(billingAddressObject)) {
					request.setAttribute("errorBillingAddress",
							"La création de l'adresse de facturation a rencontré une erreur!!");
					doGet(request, response);
				}
			} else {
				billingAddressObject.setId(Integer.parseInt(billingAddressid));
				if (!addressDao.update(billingAddressObject)) {
					request.setAttribute("errorDeliveryAddress",
							"L'adresse de facturation n'a pas pu être modifiée!!");
					doGet(request, response);
				}
			}
		}

		if (!deliveryAddress.equals("")) {
			int deliveryZip = Integer.parseInt(deliveryZipCode);
			Address deliveryAddressObject = new Address(deliveryAddress, deliveryZip, deliveryCity, userFromDB,
					deliveryAddressType);

			if (deliveryAddressid.equals("")) {
				System.out.println("Je suis dans la creation l'addresse de livraison");
				if (!addressDao.create(deliveryAddressObject)) {
					request.setAttribute("errorDeliveryAddress",
							"La création de l'adresse de livraison a rencontré une erreur!!");
					doGet(request, response);
				}
			} else {
				deliveryAddressObject.setId(Integer.parseInt(deliveryAddressid));
				if (!addressDao.update(deliveryAddressObject)) {
					request.setAttribute("errorDeliveryAddress",
							"L'adresse de livraison n'a pas pu être modifiée!!");
					doGet(request, response);
				}
			};
		}

		response.sendRedirect("dashboard");
	}

}
