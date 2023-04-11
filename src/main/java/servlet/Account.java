package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Address;
import beans.Address_type;
import beans.Order;
import beans.Order_product;
import beans.Product;
import beans.Status;
import beans.User;
import beans.VAT;
import dao.AddressDao;
import dao.CategoryDao;
import dao.UserDao;

/**
 * Servlet implementation class Account
 */
@WebServlet("/account")
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userDao = new UserDao();
	AddressDao addressDao = new AddressDao();
       
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
		
		ArrayList<Order> ordersList = new ArrayList<>();
		ordersList.add(new Order(16415, java.sql.Date.valueOf("2023-03-28"), (float) 148.59, "", "", new User(), new Address(), new Address(), new Status(1, "En cours de livraison")));
		ordersList.add(new Order(15478, java.sql.Date.valueOf("2023-01-12"), (float) 148.59, "", "", new User(), new Address(), new Address(), new Status(1, "Commande livrée")));
		ordersList.add(new Order(17482, java.sql.Date.valueOf("2023-04-07"), (float) 148.59, "", "", new User(), new Address("5 rue John Fitzgerald Kennedy", 95600, "Eaubonne", new User(), new Address_type(2, "livraison")), new Address("6-8 rue George et Maï Politzer", 75012, "Paris", new User(), new Address_type(1, "facturation")), new Status(3, "En cours de livraison")));
		request.setAttribute("ordersList", ordersList);
		
		if (request.getParameter("showOrderID") != null) {
			if (Integer.parseInt(request.getParameter("showOrderID")) > 0) {
				
				Order orderSelected = new Order(Integer.parseInt(request.getParameter("showOrderID")), java.sql.Date.valueOf("2023-04-07"), (float) 148.59, "", "6F564561561161", new User(), new Address("5 rue John Fitzgerald Kennedy", 95600, "Eaubonne", new User(), new Address_type(2, "livraison")), new Address("6-8 rue George et Maï Politzer", 75012, "Paris", new User(), new Address_type(1, "facturation")), new Status(3, "En cours de livraison"));
				request.setAttribute("orderSelected", orderSelected);
				
				ArrayList<Order_product> productsList = new ArrayList<>();
				productsList.add(new Order_product(1567745, (float) 25.99, 2, new Product(4, "Rasoir Philips super cool SC4093/09", "", (float) 0, "./assets/products/img/product_4_mainPic.jpg", "", false, "", "", "", (float) 0, 0, 0, false, new VAT()), orderSelected));
				productsList.add(new Order_product(1567745, (float) 150.99, 1, new Product(4, "Lave linge incroyable ChiQ CMB4546", "", (float) 0, "./assets/products/img/product_5_mainPic.jpg", "", false, "", "", "", (float) 0, 0, 0, false, new VAT()), orderSelected));
				request.setAttribute("productsList", productsList);
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
			userDao.update(new User(((User) session.getAttribute("currentUser")).getId(), request.getParameter("userLastName"), request.getParameter("userFirstName"), request.getParameter("userEmail"), ((User) session.getAttribute("currentUser")).getPassword(), request.getParameter("userTitle"), request.getParameter("userPhone"), new Date(System.currentTimeMillis()), ((User) session.getAttribute("currentUser")).isActive(), ((User) session.getAttribute("currentUser")).getRole()));
			User replacementUser = userDao.findById(((User) session.getAttribute("currentUser")).getId());
			System.out.println(replacementUser.getId());
			session.setAttribute("currentUser", userDao.findById(((User) session.getAttribute("currentUser")).getId()));
			request.setAttribute("backToPage", "#accountInfo");
		}
		
		if (request.getParameter("formSubmitted").equals("accountDelivery")) {
			if (request.getParameter("deliveryAddressAction").equals("update")) {
				addressDao.update(new Address(Integer.parseInt(request.getParameter("deliveryAddressID")), request.getParameter("inputStreet"), Integer.parseInt(request.getParameter("inputZipCode")), request.getParameter("inputCity"), (User) session.getAttribute("currentUser"), new Address_type(2, "livraison")));
			} else if (request.getParameter("deliveryAddressAction").equals("create")) {
				addressDao.create(new Address(request.getParameter("inputStreet"), Integer.parseInt(request.getParameter("inputZipCode")), request.getParameter("inputCity"), (User) session.getAttribute("currentUser"), new Address_type(2, "livraison")));
			}
			request.setAttribute("backToPage", "#accountDelivery");
		}
		
		if (request.getParameter("formSubmitted").equals("accountBilling")) {
			if (request.getParameter("billingAddressAction").equals("update")) {
				addressDao.update(new Address(Integer.parseInt(request.getParameter("billingAddressID")), request.getParameter("inputBillingStreet"), Integer.parseInt(request.getParameter("inputBillingZipCode")), request.getParameter("inputBillingCity"), (User) session.getAttribute("currentUser"), new Address_type(1, "facturation")));
			} else if (request.getParameter("billingAddressAction").equals("create")) {
				addressDao.create(new Address(request.getParameter("inputBillingStreet"), Integer.parseInt(request.getParameter("inputBillingZipCode")), request.getParameter("inputBillingCity"), (User) session.getAttribute("currentUser"), new Address_type(1, "facturation")));
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
