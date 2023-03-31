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
 * Servlet implementation class UserManagement
 */
@WebServlet("/user-management")
public class UserManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/****************************/
		/*        MOC               */
		/****************************/
		String action = "update"; //action is "add" or "update"
		ArrayList<Role> roles = new ArrayList<>();
		ArrayList<String> genders = new ArrayList<>();
		ArrayList<Address> deliveryAdresses = new ArrayList<>();
		
		Address_type typeOfAddress = new Address_type(2,"livraison");
		Address address1 = new Address(1, "4 rue des pins", 75000,"Paris", new User(), typeOfAddress);
		Address address2 = new Address(2, "5 rue des pins", 75000,"Paris", new User(), typeOfAddress);
		Address address3 = new Address(3, "6 rue des pins", 75000,"Paris", new User(), typeOfAddress);
		Address address4 = new Address(4, "7 rue des pins", 75000,"Paris", new User(), typeOfAddress);
		Address address5 = new Address(5, "8 rue des pins", 75000,"Paris", new User(), typeOfAddress);
		deliveryAdresses.add(address1);
		deliveryAdresses.add(address2);
		deliveryAdresses.add(address3);
		deliveryAdresses.add(address4);
		deliveryAdresses.add(address5);
		
		String gender1 = "M.";
		String gender2 = "Mme";
		genders.add(gender1);
		genders.add(gender2);
		
		Role role1 = new Role(1,"client");
		Role role2 = new Role(183,"admin");
		Role role3 = new Role(729,"vendeur");
		roles.add(role1);
		roles.add(role2);
		roles.add(role3);
		/*******************************/
		
		request.setAttribute("action", action);
		request.setAttribute("genders", genders);
		request.setAttribute("deliveryAdresses", deliveryAdresses);
		request.setAttribute("roles", roles);
		
		request.getRequestDispatcher("/view/backOffice/userManagement.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
