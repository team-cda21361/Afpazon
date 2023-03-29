package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.crypto.bcrypt.BCrypt;

import beans.Role;
import beans.User;
import dao.UserDao;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/view/register.jsp").forward(request,response);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//String lastName = request.getParameter("last_name");
		//String firstName = request.getParameter("first_name");
		//String email = request.getParameter("email");
		//String password = request.getParameter("password");
		
		String lastName = "SEGARD";
		String firstName = "Marc";
		String email = "segardmarc@toto.fr";
		String password = "marc";
		
		String pwd_with_bcrypt = BCrypt.hashpw(password, BCrypt.gensalt());
		
		
		//RoleDAO roleDao = new RoleDAO(); 
		//Role role = roleDao.getByName("Client");
		Role role = new Role(1,"Client");

		User user = new User(lastName, firstName, email, pwd_with_bcrypt, role);

		UserDao userDao = new UserDao();
		// Variable d'instance == userDao

		// userDao.addUser(user);

		if (userDao.create(user)) {
			System.out.println("bravo");

			//response.sendRedirect("/cda/");

			// request.getRequestDispatcher("vue/index.jsp").forward(request, response);
		} else {
			System.out.println("KO KO");

			doGet(request, response);
		}
		doGet(request, response);
	}

}
