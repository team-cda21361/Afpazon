package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCrypt;

import beans.Address;
import beans.Address_type;
import beans.Order;
import beans.Order_product;
import beans.User;
import dao.AddressDao;
import dao.CategoryDao;
import dao.OrderDao;
import dao.Order_productDao;
import dao.UserDao;

/**
 * Servlet implementation class Account
 */
@WebServlet("/account")
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userDao = new UserDao();
	AddressDao addressDao = new AddressDao();
	OrderDao orderDao = new OrderDao();
	Order_productDao order_productDao = new Order_productDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		CategoryDao.injectCategories(request);
		User currentUser = (User) session.getAttribute("currentUser");
		int deliveryAddressesCounter = 0;

		if (request.getParameter("deleteAddress") != null) {
			Address toDelete = new Address();
			toDelete.setId(Integer.parseInt(request.getParameter("deleteAddress")));
			addressDao.delete(toDelete);
			request.setAttribute("backToPage", "#accountDelivery");
		}
		
		ArrayList<Address> addressesList = addressDao.readById(currentUser.getId());
		for (Address address : addressesList) {
			if (address.getAddress_type().getType().equals("livraison")) {
				deliveryAddressesCounter++;
			}
		}
		request.setAttribute("deliveryAddressesCounter", deliveryAddressesCounter);
		request.setAttribute("addressesList", addressesList);			
		
		ArrayList<Order> ordersList = orderDao.readForUser((User) session.getAttribute("currentUser"));
		request.setAttribute("ordersList", ordersList);
		
		if (request.getParameter("showOrderID") != null) {
			if (Integer.parseInt(request.getParameter("showOrderID")) > 0) {
				for (Order order : ordersList) {
					if (order.getId() == Integer.parseInt(request.getParameter("showOrderID"))) {
						Order orderSelected = order;
						request.setAttribute("orderSelected", orderSelected);
						ArrayList<Order_product> productsList = order_productDao.readForOrder(orderSelected);
						request.setAttribute("productsList", productsList);
					}
				}
			}
		}
		if (request.getAttribute("deactivationLogOut") != null) {
			if ((boolean)request.getAttribute("deactivationLogOut")) {
				response.sendRedirect("accountDeactivated");
			}
		} else {
			request.getRequestDispatcher("/view/account.jsp").forward(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if (request.getParameter("formSubmitted").equals("accountInfo")) {
			if (userDao.update(new User(((User) session.getAttribute("currentUser")).getId(), request.getParameter("userLastName"), request.getParameter("userFirstName"), request.getParameter("userEmail"), ((User) session.getAttribute("currentUser")).getPassword(), request.getParameter("userTitle"), request.getParameter("userPhone"), new Date(System.currentTimeMillis()), ((User) session.getAttribute("currentUser")).isActive(), ((User) session.getAttribute("currentUser")).getRole()))) {
				session.setAttribute("currentUser", userDao.findById(((User) session.getAttribute("currentUser")).getId()));
				request.setAttribute("message", "Vos informations personnelles ont bien été mises à jour !");
			} else {
				request.setAttribute("message", "Erreur : une erreur est survenue lors de la mise à jour de vos informations personnelles.");
			}
			request.setAttribute("backToPage", "#accountInfo");
		}
		
		if (request.getParameter("formSubmitted").equals("accountPassword")) {
			if (request.getParameter("newPwd").equals(request.getParameter("confPwd"))) {
				if (BCrypt.checkpw(request.getParameter("oldPwd"), ((User) session.getAttribute("currentUser")).getPassword())) {
					String regex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,20}$";
		            Pattern p = Pattern.compile(regex);
		            Matcher m = p.matcher(request.getParameter("newPwd"));
		            if (m.matches()) {
		            	String pwd_with_bcrypt = BCrypt.hashpw(request.getParameter("newPwd"), BCrypt.gensalt());
		            	userDao.updatePassword(((User) session.getAttribute("currentUser")), pwd_with_bcrypt);
		            	session.setAttribute("currentUser", userDao.findById(((User) session.getAttribute("currentUser")).getId()));
		            	request.setAttribute("message", "Votre mot de passe a bien été mis à jour !");
		            } else {
		            	request.setAttribute("message", "Erreur : votre nouveau mot de passe ne respecte pas le format suivant : 8 à 20 caractères, et minimum 1 majuscule, 1 minuscule, 1 chiffre, 1 caractère spécial (#?!@$%^&*-).");
		            }
				} else {
					request.setAttribute("message", "Erreur : l'ancien mot de passe saisi n'est pas le bon.");
				}
			} else {
				request.setAttribute("message", "Erreur : les nouveaux mots de passe ne correspondent pas.");
			}
			request.setAttribute("backToPage", "#accountPassword");
		}
		
		if (request.getParameter("formSubmitted").equals("accountDelivery")) {
			if ((!request.getParameter("inputStreet").isEmpty()) && (!request.getParameter("inputZipCode").isEmpty()) && (!request.getParameter("inputCity").isEmpty())) {
				if (request.getParameter("deliveryAddressAction").equals("update")) {
					if (addressDao.update(new Address(Integer.parseInt(request.getParameter("deliveryAddressID")), request.getParameter("inputStreet"), Integer.parseInt(request.getParameter("inputZipCode")), request.getParameter("inputCity"), (User) session.getAttribute("currentUser"), new Address_type(2, "livraison")))) {
						request.setAttribute("message", "Votre adresse a bien été mise à jour !");
					} else {
						request.setAttribute("message", "Erreur : une erreur est survenue lors de la mise à jour de votre adresse.");
					}
				} else if (request.getParameter("deliveryAddressAction").equals("create")) {
					if (addressDao.create(new Address(request.getParameter("inputStreet"), Integer.parseInt(request.getParameter("inputZipCode")), request.getParameter("inputCity"), (User) session.getAttribute("currentUser"), new Address_type(2, "livraison")))) {
						request.setAttribute("message", "Votre adresse a bien été créée !");
					} else {
						request.setAttribute("message", "Erreur : une erreur est survenue lors de la création de votre adresse.");
					}
				}
			} else {
				request.setAttribute("message", "Erreur : vous ne pouvez pas créer une adresse avec des champs vides.");
			}
			request.setAttribute("backToPage", "#accountDelivery");
		}
		
		if (request.getParameter("formSubmitted").equals("accountBilling")) {
			if (request.getParameter("billingAddressAction").equals("update")) {
				if (addressDao.update(new Address(Integer.parseInt(request.getParameter("billingAddressID")), request.getParameter("inputBillingStreet"), Integer.parseInt(request.getParameter("inputBillingZipCode")), request.getParameter("inputBillingCity"), (User) session.getAttribute("currentUser"), new Address_type(1, "facturation")))) {
					request.setAttribute("message", "Votre adresse de facturation a bien été mise à jour !");
				} else {
					request.setAttribute("message", "Erreur : une erreur est survenue lors de la mise à jour de votre adresse de facturation.");
				}
			} else if (request.getParameter("billingAddressAction").equals("create")) {
				if (addressDao.create(new Address(request.getParameter("inputBillingStreet"), Integer.parseInt(request.getParameter("inputBillingZipCode")), request.getParameter("inputBillingCity"), (User) session.getAttribute("currentUser"), new Address_type(1, "facturation")))) {
					request.setAttribute("message", "Votre adresse de facturation a bien été créée !");
				} else {
					request.setAttribute("message", "Erreur : une erreur est survenue lors de la création de votre adresse de facturation.");
				}
			}
			request.setAttribute("backToPage", "#accountBilling");
		}
		
		if (request.getParameter("formSubmitted").equals("accountDeactivation")) {
			if (userDao.deactivate(((User) session.getAttribute("currentUser")), request.getParameter("pwdForDeactivation"))) {
				request.setAttribute("deactivationLogOut", true);
			}
		}
		
		doGet(request, response);
	}

}
