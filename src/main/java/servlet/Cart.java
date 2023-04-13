package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Item;
import beans.Product;
import dao.CategoryDao;
import dao.ProductDao;

/**
 * Servlet implementation class cart
 */
@WebServlet("/cart")
public class Cart extends HttpServlet{
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cart() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	CategoryDao.injectCategories(request);
        ProductDao productDao = new ProductDao();
        Product product = new Product();
        
        /* PANIER */
		CategoryDao.injectCategories(request);

        
        // PANIER
        HttpSession sessionP = request.getSession(true);
        
        beans.Cart cart_temp = new beans.Cart();
        if ((beans.Cart) sessionP.getAttribute("cart") == null) {
            sessionP.setAttribute("cart", cart_temp);
        }
    
        cart_temp = (beans.Cart) sessionP.getAttribute("cart");
        sessionP.setAttribute("cart", cart_temp);
        // FIN PANIER
		
        request.getRequestDispatcher("/view/cart.jsp").forward(request, response);
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    	 // PANIER
        HttpSession sessionP = request.getSession(true);
        
        beans.Cart cart_temp = new beans.Cart();
        if ((beans.Cart) sessionP.getAttribute("cart") == null) {
            sessionP.setAttribute("cart", cart_temp);
        }
        cart_temp = (beans.Cart) sessionP.getAttribute("cart");
    	
    	if (request.getParameter("plus") != null ) {
			
			int qte = Integer.parseInt(request.getParameter("plus"));
			  cart_temp.addQte(qte);
				System.out.println("PLUS: "+ qte);

			
		}
		if (request.getParameter("minus") != null ) {
			int qte = Integer.parseInt(request.getParameter("minus"));
			    cart_temp.removeQte(qte);
			    System.out.println("MINUS: "+ qte);
		}
		
		if (request.getParameter("deleteItem") != null ) {
			int idArticleToDelete=Integer.valueOf(request.getParameter("deleteItem"));
			
			cart_temp.deleteById(idArticleToDelete);
			sessionP.setAttribute("cart", cart_temp);
			
			doGet(request, response);
		}else {
			doGet(request, response);
		}
    	
    	
        doGet(request, response);
    }
    
}
