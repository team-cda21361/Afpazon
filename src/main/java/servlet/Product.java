package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ImageDao;
import dao.ProductDao;
import dao.ReviewDao;

/**
 * Servlet implementation class Product
 */
@WebServlet("/product")
public class Product extends HttpServlet{
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    ImageDao imageDao =new ImageDao();
    ProductDao productDao = new ProductDao();
    ReviewDao reviewDao = new ReviewDao();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	int id = Integer.parseInt(request.getParameter("id"));
    	int cantite = 1;

    	if(request.getParameter("plus") != null) {
    		cantite = Integer.parseInt(request.getParameter("plus"));
    		cantite = cantite + 1;
    	}
    	if(request.getParameter("minus") != null) {
    		cantite = Integer.parseInt(request.getParameter("minus"));
    		cantite = cantite - 1;
    		if(cantite <= 0) {
    			cantite =1;
    		}
    	}
    	
    	System.out.println("Plus: "+request.getParameter("plus"));
    	System.out.println("Minus: "+request.getParameter("minus"));
    	
    	request.setAttribute("review", reviewDao.findByIdProd(id));
    	
		request.setAttribute("images", imageDao.findImagesById(id));
		request.setAttribute("cantite", cantite);
		System.out.println("NOMBRE"+productDao.findById(id).getName());
		request.setAttribute("product", productDao.findById(id));
		
		
		
        request.getRequestDispatcher("/view/product.jsp").forward(request, response);
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
        
        doGet(request, response);
    }
    
}
