package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Role;
import beans.User;
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
		User user = new User();
		/*
		 * Creation d'un mock pour jongler entre les pages backoffice et site client
		 */
		//decommenter ce user pour passer en mode Admin
//		Role roleAdmin = new Role("Admin");
//		user =new User("mock@admin.fr",roleAdmin );
		//decommenter ce user pour passer en mode Client
		ProductDao produitDao = new ProductDao();
		Product produit = new Product();
		ArrayList<beans.Product> listCarousel = new ArrayList();
		
		
		Role roleClient = new Role("Client");
		user =new User("mock@admin.fr",roleClient );
		user.setId(1);
		user.setFirstName("Charles");
		HttpSession session =request.getSession(true);
		session.setAttribute("currentUser", user);
		
		if (user.getId() > 0) {
			if (user.getRole().getRole().equalsIgnoreCase("Admin")) {
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
