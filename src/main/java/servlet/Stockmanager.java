package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Stock;
import dao.StockDao;

/**
 * Servlet implementation class Stockmanager
 */
@WebServlet("/stockManager")
public class Stockmanager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       StockDao stockDao = new StockDao();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Stockmanager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("stockList", stockDao.read());
		if (request.getParameter("id")!=null) {
			Stock stock = (Stock) stockDao.findById(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("stockEdit", stock);
		}
		request.getRequestDispatcher("/view/backOffice/stockManager.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
