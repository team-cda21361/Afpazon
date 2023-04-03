package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Category;
import beans.Discount;

/**
 * Servlet implementation class GenCatalog
 */
@WebServlet("/gen-catalog")
public class GenCatalog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenCatalog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*******************************     MOC   ******************/
		ArrayList<Discount> discounts = new ArrayList<>();
		ArrayList<Category> categories = new ArrayList<>();
		
		Discount discount1 = new Discount(1, Date.valueOf("2023-05-01"), Date.valueOf("2023-05-02"), 0.2f, "PromoMai20");
		Discount discount2 = new Discount(2, Date.valueOf("2023-05-03"), Date.valueOf("2023-05-04"), 0.15f, "PromoMai15");
		Discount discount3 = new Discount(3, Date.valueOf("2023-05-04"), Date.valueOf("2023-05-06"), 0.25f, "PromoMai25");
		discounts.add(discount1);
		discounts.add(discount2);
		discounts.add(discount3);

		Category category1 = new Category(1,"High tech", true);
		Category category2 = new Category(2,"Camping", true);
		Category category3 = new Category(3,"Ameublement", true);
		categories.add(category1);
		categories.add(category2);
		categories.add(category3);
		/**********************************************************/
		
		
		
		request.setAttribute("discounts", discounts);
		request.setAttribute("categories", categories);
		
		request.getRequestDispatcher("/view/backOffice/genCatalog.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
