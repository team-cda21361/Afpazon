package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDao;
import dao.DiscountDao;
import dao.ProductDao;
import dao.VATDao;

/**
 * Servlet implementation class ProductManagement
 */
@WebServlet("/product-management")
public class ProductManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDao productDao = new ProductDao();
	CategoryDao categoryDao = new CategoryDao();
	DiscountDao discountDao = new DiscountDao();
	VATDao vatDao = new VATDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setAttribute("productList", productDao.readWarranty());
		request.setAttribute("categoryList", categoryDao.read());
		request.setAttribute("discountList", discountDao.read());
		request.setAttribute("vatList", vatDao.read());
		
		request.getRequestDispatcher("view/backOffice/productManagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
