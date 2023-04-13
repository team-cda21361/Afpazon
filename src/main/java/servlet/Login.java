package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import dao.CategoryDao;
import dao.UserDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CategoryDao.injectCategories(request);
		request.getRequestDispatcher("/view/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println("email: "+email);
		System.out.println("password: "+password);

		UserDao userDao = new UserDao();
    
		if(userDao.userActDes(email) != true) {
			User user = userDao.login(email,password);
			if (user != null) {
				HttpSession session = request.getSession(true);
				session.setAttribute("currentUser", user);
				response.sendRedirect("/Afpazon");
			} else {
				request.setAttribute("msn", "L'email ou le mot de passe n'est pas correct.");
				request.setAttribute("msnType",  "KO");
				doGet(request, response);
			}
		} else {
			request.setAttribute("msn", "Votre compte est inactif.");
			request.setAttribute("msnType",  "KO");
			doGet(request, response);
		}
	}
}
