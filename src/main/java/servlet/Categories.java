package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Product;
import beans.VAT;

/**
 * Servlet implementation class Categories
 */
@WebServlet("/categories")
public class Categories extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Categories() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Product> products = new ArrayList<>();
		
		/***********  MOC ************/
		VAT vat = new VAT(1, 19.5f);
		Product product1 = new Product(1,"Marco computer", "Super ordi de marc.", 2000.4f, "assets/images/products/product-1.jpg",  "video.mp4", true, "très gros","AT5675657", "Gris", 1.2f, 2,50,true,vat);
		Product product2 = new Product(2,"Marco computer", "Super ordi de marc.", 2000.4f, "assets/images/products/product-2.jpg",  "video.mp4", true, "très gros","AT5675657", "Gris", 1.2f, 2,50,true,vat);
		Product product3 = new Product(3,"Marco computer", "Super ordi de marc.", 2000.4f, "assets/images/products/product-3.jpg",  "video.mp4", true, "très gros","AT5675657", "Gris", 1.2f, 2,50,true,vat);
		Product product4 = new Product(4,"Marco computer", "Super ordi de marc.", 2000.4f, "assets/images/products/product-4.jpg",  "video.mp4", true, "très gros","AT5675657", "Gris", 1.2f, 2,50,true,vat);
		Product product5 = new Product(5,"Marco computer", "Super ordi de marc.", 2000.4f, "assets/images/products/product-5.jpg",  "video.mp4", true, "très gros","AT5675657", "Gris", 1.2f, 2,50,true,vat);
		Product product6 = new Product(6,"Marco computer", "Super ordi de marc.", 2000.4f, "assets/images/products/product-6.jpg",  "video.mp4", true, "très gros","AT5675657", "Gris", 1.2f, 2,50,true,vat);
		Product product7 = new Product(7,"Marco computer", "Super ordi de marc.", 2000.4f, "assets/images/products/product-7.jpg",  "video.mp4", true, "très gros","AT5675657", "Gris", 1.2f, 2,50,true,vat);
		Product product8 = new Product(8,"Marco computer", "Super ordi de marc.", 2000.4f, "assets/images/products/product-8.jpg",  "video.mp4", true, "très gros","AT5675657", "Gris", 1.2f, 2,50,true,vat);
		products.add(product1);
		products.add(product2);
		products.add(product3);
		products.add(product4);
		products.add(product5);
		products.add(product6);
		products.add(product7);
		products.add(product8);
		int moyenne_note = 4;
		int numberOfReviews = 37;
		/******************************/

		request.setAttribute("products", products);
		request.setAttribute("categorie", "High-tech");
		request.setAttribute("moyen_note", moyenne_note);
		request.setAttribute("number_of_review", numberOfReviews);
		
		
		
		
		request.getRequestDispatcher("/view/categories.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
