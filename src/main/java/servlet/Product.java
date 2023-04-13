package servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import beans.Cart;
import beans.Item;
import beans.Review;
import dao.ImageDao;
import dao.ProductDao;
import dao.Product_discountDao;
import dao.ReviewDao;
import dao.CategoryDao;

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
    beans.Product product = new beans.Product();
    ImageDao imageDao =new ImageDao();
    ProductDao productDao = new ProductDao();
    ReviewDao reviewDao = new ReviewDao();
    Review review = new Review();
    ArrayList<Review> listReviews = new ArrayList<>();
    Product_discountDao product_discountDao = new Product_discountDao();
    
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
    	listReviews = reviewDao.findByIdProd(id);
    	request.setAttribute("review", listReviews);
 
    	if(listReviews != null) {
    	   	int reviewTP = 0;
    		float startP = 0;
    		int lastIdReview = 0;
    		for (Review list : listReviews) {
    			startP = list.getStars() + startP;
    			reviewTP++;
    			lastIdReview = list.getId();
    		}
    		request.setAttribute("reviewTP", reviewTP);
    		request.setAttribute("startP", (startP/reviewTP));
    		request.setAttribute("lastIdReview", lastIdReview);
    	}
      request.setAttribute("images", imageDao.findImagesById(id));
      request.setAttribute("cantite", cantite);
      request.setAttribute("product", productDao.findById(id));
      request.setAttribute("discount", product_discountDao.findByIdProd(id));
      CategoryDao.injectCategories(request);
      request.getRequestDispatcher("/view/product.jsp").forward(request, response);
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
    	
    	//int lastidRev = Integer.parseInt(request.getParameter("idres"));
    	//System.out.println("lastidRev: "+lastidRev);
    	if(request.getParameter("idProd") != null && request.getParameter("cantiteProd") != null) {
    		
    		/* PANIER */
    		CategoryDao.injectCategories(request);

            
            // PANIER
            HttpSession sessionP = request.getSession(true);
            
            beans.Cart cart_temp = new beans.Cart();
            if ((beans.Cart) sessionP.getAttribute("cart") == null) {
                sessionP.setAttribute("cart", cart_temp);
            }
            
           
            cart_temp = (beans.Cart) sessionP.getAttribute("cart");
            Item item = null;
            product = productDao.findByIdDiscount(Integer.parseInt(request.getParameter("idProd")));
            System.out.println("QUE :"+ product.getName() );
            if(product.getName() != null) {
            	item = new Item(Integer.parseInt(request.getParameter("cantiteProd")), productDao.findByIdDiscount(Integer.parseInt(request.getParameter("idProd"))));
            }else {
            	item = new Item(Integer.parseInt(request.getParameter("cantiteProd")), productDao.findById(Integer.parseInt(request.getParameter("idProd"))));
            }
        		
                //Item item = new Item(1, product);
                
            cart_temp.addItem(item);
                sessionP.setAttribute("cart", cart_temp);
      
            // FIN PANIER
                
    		System.out.println("PRINT SESSION: "+ sessionP.getAttribute("cart"));
    		
    		
    	}

        
        doGet(request, response);
    }
    
}
