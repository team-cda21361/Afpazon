package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Address;
import beans.Address_type;
import beans.Role;
import beans.User;

/**
 * Servlet implementation class Account
 */
@WebServlet("/account")
public class Account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User(12312313, "Fouquet", "Charles", "fouquetcharles@gmail.com", "", "Male", "0645716639", java.sql.Date.valueOf("2023-03-30"), true, new Role(729, "Vendeur"));
		request.setAttribute("currentUser", user);
		ArrayList<Address> addressesList = new ArrayList<>();
		addressesList.add(new Address(1, "7 allée Epinette", 93340, "Le Raincy", new User(), new Address_type()));
		addressesList.add(new Address(7, "5 rue John Fitzgerald Kennedy", 95600, "Eaubonne", new User(), new Address_type()));
		addressesList.add(new Address(9, "6-8 rue George et Maï Politzer", 75012, "Paris", new User(), new Address_type()));
		request.setAttribute("addressesList", addressesList);
		request.getRequestDispatcher("/view/account.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
