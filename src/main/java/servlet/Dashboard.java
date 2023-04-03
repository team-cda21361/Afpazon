package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Stock;
import beans.User;
import dao.DiscountDao;
import dao.OrderDao;
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
		/*
		 * conditon for user search method/read() if no search
		 */
		if (request.getParameter("userSearch")!=null) {
			request.setAttribute("userList", userDao.search(request.getParameter("userSearch")));
			
		}else {
			request.setAttribute("userList", userDao.read());
		}
		/*
		 * conditon for product search method/read() if no search
		 */
		if (request.getParameter("productSearch")!=null) {
			request.setAttribute("stockList", stockDao.search(request.getParameter("productSearch")));
			
		}else {
			request.setAttribute("stockList", stockDao.read());	
		}
		/*
		 * conditon for discount search method/read() if no search
		 */
		if (request.getParameter("discountSearch")!=null) {
			request.setAttribute("discountList", discountDao.search(request.getParameter("discountSearch")));
			
		}else {
			
			request.setAttribute("discountList", discountDao.read());
		}
		/*
		 * conditon for user search method/read() if no search
		 */
		if (request.getParameter("orderSearch")!=null) {
			request.setAttribute("orderList", orderDao.search(request.getParameter("orderSearch")));
			
		}else {
			request.setAttribute("orderList", orderDao.read());	
		}
		
		/*
		 * Function to check if product stocks are critical
		 */
		for (Stock stock : stockDao.read()) {
			
			if (stock.getQuantity()<=5) {
				request.setAttribute("criticalStock", "Des produits sont épuisés ou en phase de l'être");	
			}
		}
		
		request.getRequestDispatcher("view/backOffice/dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
