
package servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import beans.Category;
import beans.Image;
import beans.VAT;
import dao.CategoryDao;
import dao.Category_productDao;
import dao.DiscountDao;
import dao.ImageDao;
import dao.ProductDao;
import dao.Product_discountDao;
import dao.VATDao;

/**
 * Servlet implementation class ProductManagement
 */
@WebServlet("/product-management")
@MultipartConfig
public class ProductManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDao productDao = new ProductDao();
	CategoryDao categoryDao = new CategoryDao();
	DiscountDao discountDao = new DiscountDao();

	Product_discountDao product_discountDao = new Product_discountDao();
	Category_productDao category_productDao = new Category_productDao();
	ImageDao imageDao = new ImageDao();
	VATDao vatDao = new VATDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductManagement() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		beans.Product product = null;
		String action = "add";
		ArrayList<Category> categoriesForSelect = new ArrayList<>();
		ArrayList<beans.Discount> discountsForSelect = new ArrayList<>();

		ArrayList<Image> complementaryImages = new ArrayList<>();

		if (request.getParameter("id") != null) {
			int productId = Integer.parseInt(request.getParameter("id"));
			product = productDao.findById(productId);
			product.setId(productId);
			request.setAttribute("product", product);
			request.setAttribute("discounts_product", product_discountDao.findDiscountsByProductId(productId));
			ArrayList<Category> categoriesProduct = category_productDao.findCategoriesByProductId(productId);
			complementaryImages = imageDao.findImagesById(productId);

			categoriesForSelect = category_productDao.findCategoriesNotInProductByProductId(productId);
			discountsForSelect = product_discountDao.findDiscountsNotInPorductByProductId(productId);

			request.setAttribute("categories_product", categoriesProduct);
			action = "update";
		} else {
			categoriesForSelect = categoryDao.read();
			discountsForSelect = discountDao.read();
		}

		request.setAttribute("warranties", productDao.readWarranty());
		request.setAttribute("categories", categoriesForSelect);
		request.setAttribute("discounts", discountsForSelect);
		request.setAttribute("complementary_images", complementaryImages);
		request.setAttribute("vats", vatDao.read());
		request.setAttribute("action", action);

		request.getRequestDispatcher("view/backOffice/productManagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String redirection = null;

		System.out.println("action :" + request.getParameter("action"));
		System.out.println("product  :" + request.getParameter("id-product"));
		if (request.getParameter("action").equals("add-product")) {

			String nameProduct = request.getParameter("name");
			String descriptionProduct = request.getParameter("description");
			String priceProduct = request.getParameter("price");
			String mainPicPath = request.getParameter("main-pic-path");
			String videoPath = request.getParameter("video-path");
			boolean inCaroussel = ((request.getParameter("in-caroussel") == null) ? false : true);
			String sizeProduct = request.getParameter("size");
			String reference = request.getParameter("reference");
			String colorProduct = request.getParameter("color");
			String weightProduct = request.getParameter("weight");
			String warranty = request.getParameter("warranty");
			String sponsorProduct = request.getParameter("sponsoring");
			int idProduct;

			VAT vat = vatDao.findById(Integer.parseInt(request.getParameter("TVA")));
			beans.Product product = new beans.Product(nameProduct, descriptionProduct, Float.parseFloat(priceProduct),
					mainPicPath, videoPath, inCaroussel, sizeProduct, reference, colorProduct,
					Float.parseFloat(weightProduct), Integer.parseInt(warranty), Integer.parseInt(sponsorProduct), true,
					vat);

			if (request.getParameter("id-product").equals("")) {
				if (!productDao.create(product)) {
					// gérer l'erreur
				}
				beans.Product productFromDb = productDao.findByRef(product.getReference());
				idProduct = productFromDb.getId();
				redirection = "product-management?id=" + idProduct;
			} else {
				product.setId(Integer.parseInt(request.getParameter("id-product")));
				if (!productDao.update(product)) {
					// gérer l'erreur
				}
				redirection = "dashboard";
			}

		} else if (request.getParameter("action").equals("add-image")) {
			Part part = null;
			String img = "";
			/** ======== UPLOAD IMAGE ON SERVER ============== **/
			String chemin = getServletContext().getRealPath("");

			/*
			 * Chemin dans lequel les images seront sauvegardées.
			 */
			String IMAGES_FOLDER = "assets/products/img";
			if (request.getPart("image") != null) {

				part = request.getPart("image");

				// Recup nom de l'image envoyée par l'utilisateur
				img = part.getSubmittedFileName();

				// Destination de l'image que l'on veut uploader
				String uploadPath = getServletContext().getRealPath(IMAGES_FOLDER);
				File uploadDir = new File(uploadPath);

				// Création du dossier s'il n'existe pas
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}
				part.write(chemin + IMAGES_FOLDER + File.separator + img);
			}

			int id_product = Integer.parseInt(request.getParameter("id-product"));
			beans.Product product = productDao.findById(id_product);
			product.setId(id_product);
			product.setMainPicPath(img);
			productDao.update(product);
			redirection = "product-management?id=" + id_product;
			
		} else if (request.getParameter("action").equals("add-video")) {
			Part part = null;
			String video = "";
			/** ======== UPLOAD IMAGE ON SERVER ============== **/
			String chemin = getServletContext().getRealPath("");

			/*
			 * Chemin dans lequel les images seront sauvegardées.
			 */
			String IMAGES_FOLDER = "assets/products/vid";
			if (request.getPart("video") != null) {

				part = request.getPart("video");

				// Recup nom de l'image envoyée par l'utilisateur
				video = part.getSubmittedFileName();

				// Destination de l'image que l'on veut uploader
				String uploadPath = getServletContext().getRealPath(IMAGES_FOLDER);
				File uploadDir = new File(uploadPath);

				// Création du dossier s'il n'existe pas
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}
				part.write(chemin + IMAGES_FOLDER + File.separator + video);
			}

			int id_product = Integer.parseInt(request.getParameter("id-product"));
			beans.Product product = productDao.findById(id_product);
			product.setId(id_product);
			product.setVideoPath(video);
			productDao.update(product);
			redirection = "product-management?id=" + id_product;
			
		} else if (request.getParameter("action").equals("add-more-image")) {
			Part part = null;
			String image = "";
			/** ======== UPLOAD IMAGE ON SERVER ============== **/
			String chemin = getServletContext().getRealPath("");

			/*
			 * Chemin dans lequel les images seront sauvegardées.
			 */
			String IMAGES_FOLDER = "assets/products/img";
			if (request.getPart("image") != null) {

				part = request.getPart("image");

				// Recup nom de l'image envoyée par l'utilisateur
				image = part.getSubmittedFileName();

				// Destination de l'image que l'on veut uploader
				String uploadPath = getServletContext().getRealPath(IMAGES_FOLDER);
				File uploadDir = new File(uploadPath);

				// Création du dossier s'il n'existe pas
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}
				part.write(chemin + IMAGES_FOLDER + File.separator + image);
			}

			int id_product = Integer.parseInt(request.getParameter("id-product"));
			Image imageObject = new Image(image,id_product);
			imageObject.setId(id_product);
			ImageDao imageDao = new ImageDao();
			imageDao.create(imageObject);
			
			redirection = "product-management?id=" + id_product;
		}
		response.sendRedirect(redirection);
	}

}