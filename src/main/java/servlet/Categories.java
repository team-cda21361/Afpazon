package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Product;
import beans.VAT;
import dao.CategoryDao;
import dao.ProductDao;

/**
 * Servlet implementation class Categories
 */
@WebServlet("/categories")
public class Categories extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CategoryDao categoryDao = new CategoryDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Categories() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDao.injectCategories(request);
		
		ProductDao productDao = new ProductDao();
		
		CategoryDao.injectCategories(request);
		if (request.getParameter("categorySearch")!=null) {
			int catId = Integer.parseInt(request.getParameter("categorySearch"));
			String search = String.valueOf(request.getParameter("search"));
			request.setAttribute("catProducts",new ProductDao().searchCat(catId, search));
		}else {
	

		int idCTG = Integer.parseInt(request.getParameter("catID"));

		request.setAttribute("category", categoryDao.findById(idCTG));
		
		request.setAttribute("catProducts", productDao.finMoyenne(idCTG));
		}
		
		
		
		request.getRequestDispatcher("/view/categories.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
