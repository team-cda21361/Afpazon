package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Product;
import beans.Review;
import beans.User;
import dao.ProductDao;
import dao.ReviewDao;

/**
 * Servlet implementation class UserReviewsManagement
 */
@WebServlet("/user-reviews-management")
public class UserReviewsManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       ProductDao productDao = new ProductDao();
       ReviewDao reviewDao = new ReviewDao();
       ArrayList<Review> reviews = new ArrayList<>();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReviewsManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("editOption")!=null) {
			int reviewId=Integer.parseInt(request.getParameter("id")); 
			request.setAttribute("editReview", reviewDao.findById(reviewId));
		}
		if (request.getParameter("deleteOption")!=null) {
			int reviewId=Integer.parseInt(request.getParameter("id"));

			Review review = new Review();
			review.setId(reviewId);
			if (!reviewDao.delete(review)) {
				request.setAttribute("error", "Oups!! L'avis n'a pas pu être éffacé...");
			}
		}
		//numberOfStars 
		//index 0 => number of one star
		//index 1 => number of two stars
		// ...
		Integer[] numberOfStars = {0,0,0,0,0};
		
		/****************************/
		if (request.getParameter("productId")!=null) {
			int productId = Integer.parseInt(request.getParameter("productId"));
			Product selectedProduct =productDao.findById(productId);
		    reviews = reviewDao.findByIdProd(productId);
			
		
				//Check stars of each review and put the result
				//in numberOfStars array (see above)
				int index;
				for (Review review: reviews) {
					index = review.getStars()-1;
					numberOfStars[index] += 1;
				}
				
				//reverse order to have five starts in first in the array numberOfStars
				Collections.reverse(Arrays.asList(numberOfStars));
				
				
				
				
		
				
				request.setAttribute("stars_reviews", Arrays.asList(numberOfStars));
				request.setAttribute("product", selectedProduct);
				request.setAttribute("reviews", reviews);
		
		}
		request.getRequestDispatcher("/view/backOffice/userReviewsManagement.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// the create situation
		if (request.getParameter("addBtn")!=null) {
			System.out.println("dans le delete");
			// get the review
		    HttpSession session = request.getSession();
		    User adminUser=(User) session.getAttribute("currentUser"); 
			// get new parameters
			String content = request.getParameter("review");
			int stars = Integer.parseInt(request.getParameter("stars"));
			//get the Product
			int productId = Integer.parseInt(request.getParameter("productId"));
			Product selectedProduct =productDao.findById(productId);
			Review review = new Review(content,stars,selectedProduct,adminUser);
			//create
				if (!reviewDao.create(review)) {
					request.setAttribute("error", "Oups!! La création d'avis a échoué...");
				}
				
		}
		// the update situation
		if (request.getParameter("editBtn")!=null) {
			// get the review
			int reviewId = Integer.parseInt(request.getParameter("reviewId"));
			Review review =reviewDao.findById(reviewId);
			// set new parameters
			String content = request.getParameter("review");
			int stars = Integer.parseInt(request.getParameter("stars"));
			review.setContent(content);
			review.setStars(stars);
			//update
				if (!reviewDao.update(review)) {
					request.setAttribute("error", "Oups!! la mise à jour a échoué...");
				}
			
		}

		 doGet(request, response);
	}

}
