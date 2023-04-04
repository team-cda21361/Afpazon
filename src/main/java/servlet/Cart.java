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
        
        ProductDao productDao = new ProductDao();
        Product product = new Product();
        
        // PANIER
        HttpSession sessionP = request.getSession(true);
        
        if ((Cart) sessionP.getAttribute("cart") == null) {
            Cart cart_temp = new Cart();
            sessionP.setAttribute("cart", cart_temp);
        }
        
        if (request.getParameter("getCart") != null) {
            Cart cartD = (Cart) sessionP.getAttribute("cart");
            product = productDao.findById(Integer.parseInt(request.getParameter("getCart")));
            Item item = new Item(1, product);
            // cartD.addItem(item);
            sessionP.setAttribute("cart", cartD);
        }
        // FIN PANIER
        request.getRequestDispatcher("/view/cart.jsp").forward(request, response);
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
    
}
