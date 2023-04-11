package servlet;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	private ArrayList<beans.Product> listNewProduct = new ArrayList<>();
	private ArrayList<beans.Product_discount> listNewProductDiscount = new ArrayList<>();
	private ProductDao produitDao = new ProductDao();
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
		//fin mock
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected void pageLoad(HttpServletRequest request, HttpServletResponse response) {
		lisProductDiscounts = produitDaoProduct_discountDao.findProdDiscountSponsoring();
		request.setAttribute("discountsProdSponsoring", lisProductDiscounts);
		
		listNewProduct = produitDao.findNewProdCarousel();
		request.setAttribute("newProdCarousel", listNewProduct);
		
		listNewProductDiscount = produitDaoProduct_discountDao.findSponsoredProducts();
		request.setAttribute("newProdSponsored", listNewProductDiscount);
	
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
