package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Category;
import beans.Item;
import dao.CategoryDao;
import dao.ProductDao;
import dao.Product_discountDao;

/**
 * Servlet implementation class Categories
 */
@WebServlet("/categories")
public class Categories extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryDao categoryDao = new CategoryDao();
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
    beans.Product product = new beans.Product();
    ProductDao productDao = new ProductDao();
    Product_discountDao product_discountDao = new Product_discountDao();

    Category category = new Category();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDao.injectCategories(request);
		
		ProductDao productDao = new ProductDao();
		

		CategoryDao.injectCategories(request);
		if (request.getParameter("categorySearch")!=null) {
			int catId = Integer.parseInt(request.getParameter("categorySearch"));
			String search = String.valueOf(request.getParameter("search"));
			request.setAttribute("catProducts",new ProductDao().prodCards(catId, search));
		}else {

		int idCTG = Integer.parseInt(request.getParameter("catID"));

		request.setAttribute("category", categoryDao.findById(idCTG));
		
		request.setAttribute("catProducts", productDao.prodCards(idCTG,""));
		}
		
		
		
		request.getRequestDispatcher("/view/categories.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("idProd") != null) {
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
            ArrayList<beans.Discount> discounts = new ArrayList<>();
            product = productDao.findByIdDiscount(Integer.parseInt(request.getParameter("idProd")));
            beans.Discount discount = new beans.Discount();

            if(product.getName() != null) {
            	product = productDao.findByIdDiscount(Integer.parseInt(request.getParameter("idProd")));
            	discount = product_discountDao.findByIdProd(Integer.parseInt(request.getParameter("idProd"))).getDiscount();
            	discounts.add(discount);
            	double remise = product.getPrice()-(discount.getPercent() * product.getPrice());
            	item = new Item(1, product , discounts, remise);
            }else {
            	discounts.add(discount);
            	product = productDao.findById(Integer.parseInt(request.getParameter("idProd")));
            	item = new Item(1, product , discounts, product.getPrice() );
            }
        		
            //Item item = new Item(1, product);
            if(cart_temp.addItem(item)) {
	             request.setAttribute("msn", "Le produit a �t� ajout� � votre panier.");
	             request.setAttribute("msnType",  "OK");
            }else {
	             request.setAttribute("msn", "Le produit n'a �t� pas ajout� � votre panier.");
	             request.setAttribute("msnType",  "KO");
            }
            sessionP.setAttribute("cart", cart_temp);
      
            // FIN PANIER
                
    		System.out.println("PRINT SESSION: "+ sessionP.getAttribute("cart"));
    		
    		
    	}

		doGet(request, response);
	}

}
