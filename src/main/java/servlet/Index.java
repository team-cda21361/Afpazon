package servlet;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Item;
import beans.User;
import dao.CategoryDao;
import dao.ProductDao;
import dao.Product_discountDao;


/**
 * Servlet implementation class home
 */
@WebServlet("/")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Product_discountDao produitDaoProduct_discountDao = new Product_discountDao();
	private ArrayList<beans.Product_discount> lisProductDiscounts = new ArrayList<>();
	private ArrayList<beans.Product_discount> listNewProductDiscount = new ArrayList<>();
	private ProductDao produitDao = new ProductDao();
	Product_discountDao product_discountDao = new Product_discountDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDao.injectCategories(request);
		HttpSession session = request.getSession(true);
		User currentUser = (User) session.getAttribute("currentUser");
if(request.getParameter("idProd") != null ) {
			
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
			beans.Product product = produitDao.findByIdDiscount(Integer.parseInt(request.getParameter("idProd")));
			beans.Discount discount = new beans.Discount();
			
			if(product.getName() != null) {
				product = produitDao.findByIdDiscount(Integer.parseInt(request.getParameter("idProd")));
				discount = product_discountDao.findByIdProd(Integer.parseInt(request.getParameter("idProd"))).getDiscount();
				discounts.add(discount);
				double remise = product.getPrice()-(discount.getPercent() * product.getPrice());
				item = new Item(1, product , discounts, remise);
			}else {
				discounts.add(discount);
				product = produitDao.findById(Integer.parseInt(request.getParameter("idProd")));
				item = new Item(1, product , discounts, product.getPrice() );
			}
			
			//Item item = new Item(1, product);
			if(cart_temp.addItem(item)) {
				request.setAttribute("msn", "Le produit a été ajouté à votre panier.");
				request.setAttribute("msnType",  "OK");
			}else {
				request.setAttribute("msn", "Le produit n'a été pas ajouté à votre panier.");
				request.setAttribute("msnType",  "KO");
			}
			sessionP.setAttribute("cart", cart_temp);
			System.out.println("PRINT SESSION: "+ sessionP.getAttribute("cart"));
		}
			
			// FIN PANIER
		
		if (currentUser != null) {
			if (currentUser.getRole().getRole().equalsIgnoreCase("Admin")) {
				response.sendRedirect("dashboard");
				System.out.println("en mode Admin");
			} else {
				pageLoad(request, response);
			}
		} else {	
			pageLoad(request, response);
		}
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void pageLoad(HttpServletRequest request, HttpServletResponse response) {
	//	lisProductDiscounts = produitDaoProduct_discountDao.findSponsoredProducts(); Attention, a refaire
		request.setAttribute("discountsProdSponsoring", produitDaoProduct_discountDao.findDiscountProdCarousel());
		
		//listNewProduct = produitDao.findNewProdCarousel();
		request.setAttribute("newProdCarousel", produitDao.finProductForCarousel());
		
		//listNewProductDiscount = produitDaoProduct_discountDao.findSponsoredProducts();
		request.setAttribute("newProdSponsored", produitDaoProduct_discountDao.findSponsoredProducts());
	
		try {
			request.getRequestDispatcher("/view/index.jsp").forward(request,response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	}

}
