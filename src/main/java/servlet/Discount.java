package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.AddProductList;
import beans.Product;
import beans.Product_discount;
import dao.CategoryDao;
import dao.DiscountDao;
import dao.ProductDao;
import dao.Product_discountDao;

/**
 * Servlet implementation class Discount
 */
@WebServlet("/discount")
public class Discount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       CategoryDao categoryDao = new CategoryDao();
       AddProductList addProd = new AddProductList();
       ProductDao productDao = new ProductDao();
       DiscountDao discountDao = new DiscountDao();
       ArrayList<Product> list=new ArrayList<>();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Discount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("editOption")!=null) {
			int discountId = Integer.parseInt(request.getParameter("id"));
			productDao.findByIdDiscount(discountId);
			request.setAttribute("productList", list);
			/*
			 * upadte condition to fill inputs in
			 */
			request.setAttribute("discountEdit", discountDao.findById(discountId));
			
		}
		/*
		 * jsp title management
		 */
		if (request.getParameter("editOption")!=null) {
			request.setAttribute("titleEdit", "Modification");
		}
		/*
		 *  Empty list
		 */
		if (request.getParameter("deleteId")!=null) {
			
			addProd.delete(list,Integer.parseInt(request.getParameter("deleteId")));
			request.setAttribute("productList", list);
		}
		/*
		 * discountDao read method for the select in jsp
		 */
		request.setAttribute("categoryList", categoryDao.read());
	
		
		request.getRequestDispatcher("/view/backOffice/discountManagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * Delete 1 product from list
		 */
		if (request.getParameter("empty")!=null) {
			list.clear();
			request.setAttribute("productList", list);
		}
		/*
		 * Add category products in table management
		 */
		if (request.getParameter("selectCat")!=null) {
			int categoryId = Integer.parseInt(request.getParameter("selectCat"));
			productDao.readByCategory(list, categoryId);
				request.setAttribute("productList", list);
			
		}
		/*
		 * Add product table management
		 */
		if (request.getParameter("addProductRef")!=null) {
			Product product = productDao.findByRef(request.getParameter("addProductRef"));
			if (!addProd.isExist(list, product.getId())) {
				list.add(product);
				request.setAttribute("productList", list);
			} 
		}
		/*
		 * create a discount and associate selected products
		 */
		
		if (request.getParameter("createDiscount")!=null) {
			if (request.getParameter("voucher")!="" || request.getParameter("percent")!="") {
				
				Date startDate = Date.valueOf(request.getParameter("startDate")) ;
				Date endDate = Date.valueOf(request.getParameter("endDate")) ;
				String voucher = request.getParameter("voucher");
				Float percent = Float.parseFloat(request.getParameter("percent"));
				int dateCompare = startDate.compareTo(endDate);
				// input control on dates before insert datas
					if (dateCompare > 0) {
						request.setAttribute("error", "Oups!!! une erreur s'est produite");
					}else {
						beans.Discount newdiscount = new beans.Discount(startDate,endDate,percent,voucher);
						// discount creation
							if (!discountDao.create(newdiscount)) {
								request.setAttribute("error", "Oups!!! une erreur s'est produite");
							}else {
								int lastId= discountDao.lastInsertId();
								beans.Discount discount = new beans.Discount(lastId);
								//create products related to the discount in product_discount
								for (Product product : list) {
									Product_discount prod_discount = new Product_discount(product,discount);
									new Product_discountDao().create(prod_discount);
								}
							}//create discount if condition end
					}//date compare if condition end
			}//end empty input if condition
		}//create if condition end
		/*
		 * create a discount and associate selected products
		 */
		
		if (request.getParameter("updateDiscount")!=null) {
			int discountId = Integer.parseInt(request.getParameter("discountId"));
			Date startDate = Date.valueOf(request.getParameter("startDate")) ;
			Date endDate = Date.valueOf(request.getParameter("endDate")) ;
			String voucher = request.getParameter("voucher");
			Float percent = Float.parseFloat(request.getParameter("percent"));
			beans.Discount newdiscount = new beans.Discount(discountId,startDate,endDate,percent,voucher);
			if (!discountDao.update(newdiscount)) {
				request.setAttribute("error", "Oups!!! une erreur s'est produite");
			}
			
		}
		
		doGet(request, response);
	}

}
