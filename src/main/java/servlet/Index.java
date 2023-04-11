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
/**
 * Servlet implementation class home
 */
@WebServlet("/")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
		ProductDao produitDao = new ProductDao();

		ArrayList<beans.Product> listCarousel = new ArrayList<>();
    Product produit = new Product();
		
		if (currentUser != null) {
			if (currentUser.getRole().getRole().equalsIgnoreCase("Admin")) {
				response.sendRedirect("dashboard");
				System.out.println("en mode Admin");
			} else {
				listCarousel = produitDao.findProdCarousel();
				request.setAttribute("carousel", listCarousel);
				request.getRequestDispatcher("/view/index.jsp").forward(request,response);
				System.out.println("en mode Client");
			}
		} else {	
			request.getRequestDispatcher("/view/index.jsp").forward(request,response);
			System.out.println("en mode visiteur");
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

}
