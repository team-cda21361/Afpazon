package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	/*	if (request.getParameter("userSearch")!=null) {
			request.setAttribute("userList", userDao.search(request.getParameter("userSearch")));
			
		}else {
		}*/
		request.setAttribute("userList", userDao.read());
		request.setAttribute("stockList", new StockDao().read());
		request.setAttribute("discountList", new DiscountDao().read());
		request.setAttribute("orderList", new OrderDao().read());
		
		request.getRequestDispatcher("view/backOffice/dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
