package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Address;
import beans.Address_type;
import beans.Order;
import beans.Product;
import beans.Status;
import beans.User;
import beans.VAT;

/**
 * Servlet implementation class OrderManagement
 */
@WebServlet("/order-management")
public class OrderManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*******************   MOC  ***************************/
		String action = "update"; //action is "add" or "update"
		Address_type typeOfAddress = new Address_type(2,"livraison");
		Address_type typeOfAddress2 = new Address_type(1,"facturation");
		Address address1 = new Address(1, "4 rue des pins", 75000,"Paris", new User(), typeOfAddress);
		Address address2 = new Address(1, "4 rue des pins", 75000,"Paris", new User(), typeOfAddress2);
		Order order = new Order(1,Date.valueOf("2023-05-13"), 150.6f, "HGHGJHGJ", "GHG77GGGJ", new User(), address1,address2, new Status(1,"En cours"));
		
		ArrayList<Product> products = new ArrayList<>();
		VAT vat = new VAT(1, 19.5f);
		products.add(new Product(1,"Marco computer", "Super ordi de marc.", 2000.4f, "assets/images/products/product-5.jpg", 
				"video.mp4", true, "très gros","AT5675657", "Gris", 1.2f, 2,50,true,vat));
		products.add(new Product(2,"Marco computer", "Super ordi de marc.", 2000.4f, "assets/images/products/product-5.jpg", 
				"video.mp4", true, "très gros","AT5675657", "Gris", 1.2f, 2,50,true,vat));
		products.add(new Product(3,"Marco computer", "Super ordi de marc.", 2000.4f, "assets/images/products/product-5.jpg", 
				"video.mp4", true, "très gros","AT5675657", "Gris", 1.2f, 2,50,true,vat));
		products.add(new Product(4,"Marco computer", "Super ordi de marc.", 2000.4f, "assets/images/products/product-5.jpg", 
				"video.mp4", true, "très gros","AT5675657", "Gris", 1.2f, 2,50,true,vat));
		products.add(new Product(5,"Marco computer", "Super ordi de marc.", 2000.4f, "assets/images/products/product-5.jpg", 
				"video.mp4", true, "très gros","AT5675657", "Gris", 1.2f, 2,50,true,vat));
		
		
		ArrayList<Status> status = new ArrayList<>();
		status.add(new Status(1,"Commande validée"));
		status.add(new Status(2,"En préparation"));
		status.add(new Status(3,"En cours de livraison"));
		status.add(new Status(4,"Commande livrée"));
		
		
		

		
		/******************************************************/
		
		
		request.setAttribute("products", products);
		request.setAttribute("action", action);
		request.setAttribute("status", status);
		request.setAttribute("order", order);
		
		
		request.getRequestDispatcher("/view/backOffice/orderManagement.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
