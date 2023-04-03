package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
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
		request.getRequestDispatcher("/view/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//String email = request.getParameter("email");
		//String password = request.getParameter("password");
		 String email = "segardmarc@toto.fr";
		 String password= "marc";
		
		

		UserDao userDao = new UserDao();
		User user = userDao.login(email,password);
		// System.out.println(user.getNom());

		if (user != null) {
			HttpSession session = request.getSession(true);
			session.setAttribute("currentUser", user);
			System.out.println("Connexion ok!!");
		} else {
			request.setAttribute("error", "Oups ! login ou mot de passe incorrect");
		}

		response.sendRedirect(request.getHeader("referer"));
	}
}
