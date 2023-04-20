package servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.itextpdf.text.Image;

import dao.Category_productDao;
import dao.ImageDao;
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
	ImageDao imageDao = new ImageDao();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		int idProduct = Integer.parseInt(request.getParameter("id-product"));
		String idString = request.getParameter("id");

		System.out.println("id" + idString);
		System.out.println("idProduct" + idProduct);

		if (action.equals("delete-image-complementaire-from-product")) {
			imageDao.deleteImageFromProduct(new beans.Image(idString,idProduct));
		} else if (!idString.equals("Choisissez une promotion") && !idString.equals("Choisissez une categorie")) {

			int id = Integer.parseInt(idString);

			System.out.println("id" + id);
			System.out.println("idProduct" + idProduct);

			switch (action) {
			case "delete-category-from-product": {
				System.out.println("Je supprime la catégorie du produit");
				category_productDao.deleteCategoryFromProductById(id, idProduct);
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
		}

		if (action.equals("delete-image-complementaire-from-product")) {
			System.out.println("Je supprime une image complémentaire");
		}

		response.sendRedirect("product-management?id=" + idProduct);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String typeMedia = request.getParameter("type-media");
		// int idProduct = Integer.parseInt(request.getParameter("id-product"));
		String idProduct = request.getParameter("id-product");

		System.out.println(typeMedia + " ---  " + idProduct);

		// response.sendRedirect("product-management?id=" + idProduct);
	}

}
