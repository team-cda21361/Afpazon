
package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Category;
import beans.VAT;
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
		String nameProduct = request.getParameter("name");
		String descriptionProduct = request.getParameter("description");
		String priceProduct = request.getParameter("price");
		String mainPicPath = request.getParameter("main-pic-path");
		String videoPath = request.getParameter("video-path");
		boolean inCaroussel = ((request.getParameter("in-caroussel")==null) ? false : true);
		String sizeProduct = request.getParameter("size");
		String reference = request.getParameter("reference");
		String colorProduct = request.getParameter("color");
		String weightProduct = request.getParameter("weight");
		String warranty = request.getParameter("warranty");
		String sponsorProduct = request.getParameter("sponsoring");
		int idProduct;
		String redirection;
	
		VAT vat = vatDao.findById(Integer.parseInt(request.getParameter("TVA")));
		beans.Product product = new beans.Product(nameProduct, descriptionProduct, Float.parseFloat(priceProduct),mainPicPath, videoPath, inCaroussel, sizeProduct, reference, colorProduct, Float.parseFloat(weightProduct),
				Integer.parseInt(warranty), Integer.parseInt(sponsorProduct),true ,vat);
		
		
		if(request.getParameter("id-product").equals("")) {
			if(!productDao.create(product)) {
				//gérer l'erreur
			}
			beans.Product productFromDb = productDao.findByRef(product.getReference());
			idProduct = productFromDb.getId();
			redirection="product-management?id="+idProduct;
		}else {
			product.setId(Integer.parseInt(request.getParameter("id-product")));
			if (!productDao.update(product)) {
				//gérer l'erreur
			}
			redirection="dashboard";
		}
		
		response.sendRedirect(redirection);
	}

}