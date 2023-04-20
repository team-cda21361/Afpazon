package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Address;
import beans.Address_type;
import beans.User;
import dao.AddressDao;
import dao.CategoryDao;
import dao.OrderDao;
import dao.Order_productDao;
import dao.UserDao;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userDao = new UserDao();
	AddressDao addressDao = new AddressDao();
	OrderDao orderDao = new OrderDao();
	Order_productDao order_productDao = new Order_productDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment() {
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

	
		if(currentUser != null) {
		ArrayList<Address> addressesList = addressDao.readById(currentUser.getId());
		for (Address address : addressesList) {
			if (address.getAddress_type().getType().equals("livraison")) {
				deliveryAddressesCounter++;
			}
		}
		request.setAttribute("deliveryAddressesCounter", deliveryAddressesCounter);
		request.setAttribute("addressesList", addressesList);	
		request.setAttribute("addressesFacturation", addressDao.readByIdAdresseFacturation(currentUser.getId()));	
		}
		
		request.getRequestDispatcher("/view/payment.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		CategoryDao.injectCategories(request);
	
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		UserDao userDao = new UserDao();
		User currentUser = new User();
		String regex = "";
		Pattern p;
		Matcher m;
		if(email != null && password != null) {
			if(userDao.userActDes(email) != true) {
				User user = userDao.login(email,password);
				if (user != null) {
					HttpSession session = request.getSession(true);
					session.setAttribute("currentUser", user);
					currentUser = (User) session.getAttribute("currentUser");
					doGet(request, response);
				} else {
					request.setAttribute("msn", "L'email ou le mot de passe n'est pas correct.");
					request.setAttribute("msnType",  "KO");
					doGet(request, response);
				}
			} else {
				request.setAttribute("msn", "Votre compte est inactif.");
				request.setAttribute("msnType",  "KO");
				doGet(request, response);
			}
		}
		HttpSession session = request.getSession(true);
		currentUser = (User) session.getAttribute("currentUser");
		if(currentUser != null && request.getParameter("telephoneP") != null) {
			if(request.getParameter("telephoneP").equals("telNew") || request.getParameter("telephoneP").equals("telEdit")) {
				String tel = request.getParameter("phone").trim();
				if(tel.equalsIgnoreCase("")) {
		            request.setAttribute("msn", "Le numéro de téléphone ne peut être vide..");
		            request.setAttribute("msnType",  "KO");
		            doGet(request, response);
		            return;
				}else {
					 // Regex password.
		            regex = "(0|\\+33|0033)[1-9][0-9]{8}";
		             // Compile the ReGex
		            p = Pattern.compile(regex);
		            // and regular expression.
		            m = p.matcher(tel);
		            if(!m.matches()) {
		    			request.setAttribute("msn", "Le numéro de téléphone doit être composé de chiffres.");
		    			request.setAttribute("msnType",  "KO");
		    			//doGet(request, response);
		    			doGet(request, response);
		            }else {
		
		            	if(userDao.changeTelephone(currentUser.getId(), request.getParameter("phone").trim())) {
		            		currentUser.setPhone(request.getParameter("phone").trim());
		            		session.setAttribute("currentUser", currentUser);
				            request.setAttribute("msn", "Le numéro de téléphone a été ajouté avec succès..");
				            request.setAttribute("msnType",  "OK");
				            //doGet(request, response);
				            doGet(request, response);
						}else {
				            request.setAttribute("msn", "Le numéro de téléphone n'a pas été ajouté avec succès..");
				            request.setAttribute("msnType",  "KO");
				            //doGet(request, response);
				            doGet(request, response);
						}
		            }
				}
			}

		}if(currentUser != null && request.getParameter("AdresseP") != null && request.getParameter("AdresseP").equals("AdresseP")) {
			if(request.getParameter("inputStreetA").isEmpty() || request.getParameter("inputZipCodeA").isEmpty()  || request.getParameter("inputCityA").isEmpty() ) {
	            request.setAttribute("msn", "Vous devez remplir tous les champs de l'adresse !..");
	            request.setAttribute("msnType",  "KO");
	            doGet(request, response);
			}else {
				if(request.getParameter("AdresseP").equals("AdresseP")) {
					if (addressDao.create(new Address(request.getParameter("inputStreetA"), Integer.parseInt(request.getParameter("inputZipCodeA")), request.getParameter("inputCityA"), (User) session.getAttribute("currentUser"), new Address_type(2, "livraison")))) {
			            request.setAttribute("msn", "Votre adresse a bien été mise à jour !");
			            request.setAttribute("msnType",  "OK");
						doGet(request, response);
					} else {
			            request.setAttribute("msn", "Votre adresse n'a été pas bien mise à jour !");
			            request.setAttribute("msnType",  "KO");
						doGet(request, response);
					}
				}				
			}

					
		}if(currentUser != null && request.getParameter("AdresseP") != null && request.getParameter("AdresseP").equals("AdresseF")) {
			if(request.getParameter("inputStreetF").isEmpty() || request.getParameter("inputZipCodeF").isEmpty()  || request.getParameter("inputCityF").isEmpty() ) {
	            request.setAttribute("msn", "Vous devez remplir tous les champs de l'adresse !..");
	            request.setAttribute("msnType",  "KO");
	            doGet(request, response);
			}else {
				if(request.getParameter("AdresseP").equals("AdresseF") && request.getParameter("AdresseP2").equals("0")) {
					if (addressDao.create(new Address(request.getParameter("inputStreetF"), Integer.parseInt(request.getParameter("inputZipCodeF")), request.getParameter("inputCityF"), (User) session.getAttribute("currentUser"), new Address_type(1, "facturation")))) {
			            request.setAttribute("msn", "Votre adresse a bien été crée !");
			            request.setAttribute("msnType",  "OK");
						doGet(request, response);
					} else {
			            request.setAttribute("msn", "Votre adresse n'a été pas crée !");
			            request.setAttribute("msnType",  "KO");
						doGet(request, response);
					}
				}				
			}		
		}
		if(currentUser != null && request.getParameter("AdresseP") != null && request.getParameter("AdresseP").equals("AdresseF")) {
			if(request.getParameter("inputStreetF").isEmpty() || request.getParameter("inputZipCodeF").isEmpty()  || request.getParameter("inputCityF").isEmpty() ) {
	            request.setAttribute("msn", "Vous devez remplir tous les champs de l'adresse !..");
	            request.setAttribute("msnType",  "KO");
	            doGet(request, response);
			}else {
				if(request.getParameter("AdresseP").equals("AdresseF") && !request.getParameter("AdresseP2").equals("0")) {
					if (addressDao.update(new Address(Integer.parseInt(request.getParameter("AdresseP2")), request.getParameter("inputStreetF"), Integer.parseInt(request.getParameter("inputZipCodeF")), request.getParameter("inputCityF"), (User) session.getAttribute("currentUser"), new Address_type(1, "facturation")))) {
			            request.setAttribute("msn", "Votre adresse a bien été mise à jour !");
			            request.setAttribute("msnType",  "OK");
						doGet(request, response);
					} else {
			            request.setAttribute("msn", "Votre adresse n'a été pas bien mise à jour !");
			            request.setAttribute("msnType",  "KO");
						doGet(request, response);
					}
				}				
			}		
		}
	}			
			
}

	
	
		


