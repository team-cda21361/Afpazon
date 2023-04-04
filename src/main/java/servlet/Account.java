package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Address;
import beans.Address_type;
import beans.Order;
import beans.Order_product;
import beans.Product;
import beans.Role;
import beans.Status;
import beans.User;
import beans.VAT;

/**
 * Servlet implementation class Account
 */
@WebServlet("/account")
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		User user = new User(12312313, "Fouquet", "Charles", "fouquetcharles@gmail.com", "", "M.", "0645716639", java.sql.Date.valueOf("2023-03-30"), true, new Role(729, "Vendeur"));
		request.setAttribute("currentUser2", user);
		
		ArrayList<Address> addressesList = new ArrayList<>();
		addressesList.add(new Address(1, "7 allée Epinette", 93340, "Le Raincy", new User(), new Address_type()));
		addressesList.add(new Address(7, "5 rue John Fitzgerald Kennedy", 95600, "Eaubonne", new User(), new Address_type()));
		addressesList.add(new Address(9, "6-8 rue George et Maï Politzer", 75012, "Paris", new User(), new Address_type()));
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
		request.getRequestDispatcher("/view/account.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
