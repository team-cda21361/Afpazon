package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Stock;
import beans.User;
import dao.DiscountDao;
import dao.OrderDao;
import dao.ProductDao;
import dao.StockDao;
import dao.UserDao;

/**
 * Servlet implementation class Dashboard
 */
@WebServlet("/dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       UserDao userDao = new UserDao();
       StockDao stockDao = new StockDao();
       OrderDao orderDao = new OrderDao();
       ProductDao productDao = new ProductDao();
       DiscountDao discountDao = new DiscountDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Recuperation du nom du user connect�
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		request.setAttribute("currentUser", currentUser);
				
		/*
		 * user desactivation
		 */
			if (request.getParameter("userStatusOption")!=null) {
				int userId = Integer.parseInt(request.getParameter("userId"));
				User user =userDao.findById(userId);
			
					if (user.isActive()) {
						user.setActive(false);
						if (!userDao.changeUserStatus(user)) {
							request.setAttribute("error", "Oups! L'utilisateur n'a pas pu être désactivé");
						}
					} else if (!user.isActive()) {					
						user.setActive(true);
						if (!userDao.changeUserStatus(user)) {
							request.setAttribute("error", "Oups! L'utilisateur n'a pas pu être activé");
						}
						
					}
			}
			/*
			 * product desactivation
			 */
			if (request.getParameter("productStatusOption")!=null) {
				int prodId = Integer.parseInt(request.getParameter("prodId"));
				beans.Product product =productDao.findById(prodId);
				
				if (product.isActive()) {
					product.setActive(false);
					if (!productDao.changeProductStatus(product)) {
						request.setAttribute("error", "Oups! Le produit n'a pas pu être désactivé");
					}
				} else if (!product.isActive()) {					
					product.setActive(true);
					if (!productDao.changeProductStatus(product)) {
						request.setAttribute("error", "Oups! Le produit n'a pas pu être activé");
					}
					
				}
			}
			request.setAttribute("userList", userDao.read());

            request.setAttribute("stockList", stockDao.read());

            request.setAttribute("discountList", discountDao.read());

            request.setAttribute("orderList", orderDao.read());
		
		
		/*
		 * Function to check if product stocks are critical
		 */
		for (Stock stock : stockDao.read()) {
			
			if (stock.getQuantity()<=5) {
				request.setAttribute("criticalStock", "Des produits sont épuisés ou en phase de l'être");	
			}
		}
		
		request.getRequestDispatcher("/view/backOffice/dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
