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
		User user = userDao.login(email,password);

		// System.out.println(user.getNom());

		if (user != null) {
			HttpSession session = request.getSession(true);
			session.setAttribute("currentUser", user);
			System.out.println("Connexion ok!!");
			request.getRequestDispatcher("view/index.jsp").forward(request,response);
			return;
		} else {
	      	request.setAttribute("msn", "L'email ou le mot de passe n'est pas correct.");
			request.setAttribute("msnType",  "KO");
			request.getRequestDispatcher("view/login.jsp").forward(request,response);
		}

		//response.sendRedirect(request.getHeader("referer"));
		doGet(request, response);
	}
}
