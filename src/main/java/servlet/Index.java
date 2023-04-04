package servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Role;
import beans.User;

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
		
		/*
		 * Creation d'un mock pour jongler entre les pages backoffice et site client
		 */
		//decommenter ce user pour passer en mode Admin
//		Role roleAdmin = new Role("Admin");
//		User user =new User("mock@admin.fr",roleAdmin );
		//decommenter ce user pour passer en mode Client
		Role roleClient = new Role("Client");
		User user =new User("mock@admin.fr",roleClient );
		HttpSession session =request.getSession(true);
		session.setAttribute("currentUser", user);
	
		if (user.getRole().getRole().equalsIgnoreCase("Admin")) {
			response.sendRedirect("dashboard");
			System.out.println("en mode Admin");
		}else if(user.getRole().getRole().equalsIgnoreCase("Client")) {	
			request.getRequestDispatcher("/view/index.jsp").forward(request,response);
			System.out.println("en mode Client");
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
