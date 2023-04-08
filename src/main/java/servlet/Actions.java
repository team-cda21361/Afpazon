package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Category_productDao;
import dao.Product_discountDao;

/**
 * Servlet implementation class Actions
 */
@WebServlet("/actions")
public class Actions extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Actions() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	Category_productDao category_productDao = new Category_productDao();
	Product_discountDao product_discountDao = new Product_discountDao();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action= request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("id"));
		int idProduct = Integer.parseInt(request.getParameter("id-product"));
		
		System.out.println("id"+ id);
		System.out.println("idProduct" + idProduct);
		System.out.println("action" + action);
		
		switch (action) {
		case "delete-category-from-product": {
			System.out.println("Je supprime la catégorie du produit");
			category_productDao.deleteCategoryFromProductById(id,idProduct);
			break;
		}
		case "delete-discount-from-product": {
			System.out.println("Je supprime la promo du produit");
			product_discountDao.deleteDiscountFromProductById(id, idProduct);
			break;
		}
		case "add-category-to-product": {
			System.out.println("J'ajoute la catégorie du produit");
			category_productDao.addCategoryToProductById(id, idProduct);
			break;
		}
		case "add-discount-to-product": {
			System.out.println("J'ajoute la promo du produit");
			product_discountDao.addDiscountToProductById(id, idProduct);
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + action);
		}
		
		response.sendRedirect("product-management?id=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
