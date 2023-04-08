
package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Category;
import dao.CategoryDao;
import dao.Category_productDao;
import dao.DiscountDao;
import dao.ProductDao;
import dao.Product_discountDao;
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
	Product_discountDao product_discountDao = new Product_discountDao();
	Category_productDao category_productDao = new Category_productDao();
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
		beans.Product product = null;
		String action="add";
		ArrayList<Category> categoriesForSelect = new ArrayList<>();
		ArrayList<beans.Discount> discountsForSelect = new ArrayList<>();
		
		
		if (request.getParameter("id")!=null) {
			int productId= Integer.parseInt(request.getParameter("id"));
			product = productDao.findById(productId);
			product.setId(productId);
			request.setAttribute("product",product);
			request.setAttribute("discounts_product",product_discountDao.findDiscountsByProductId(productId));
			ArrayList<Category> categoriesProduct = category_productDao.findCategoriesByProductId(productId);

		
			categoriesForSelect = category_productDao.findCategoriesNotInProductByProductId(productId);
			discountsForSelect = product_discountDao.findDiscountsNotInPorductByProductId(productId); 
			
			request.setAttribute("categories_product",categoriesProduct);
			action="update";
		} else {
			categoriesForSelect = categoryDao.read();
			discountsForSelect = discountDao.read();
		}
	
		
		request.setAttribute("warranties", productDao.readWarranty());
		request.setAttribute("categories", categoriesForSelect);
		request.setAttribute("discounts", discountsForSelect);
		request.setAttribute("vats", vatDao.read());
		request.setAttribute("action", action);
		
		
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