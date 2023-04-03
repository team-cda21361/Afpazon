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

import beans.Product;
import beans.Review;
import beans.User;
import beans.VAT;

/**
 * Servlet implementation class UserReviewsManagement
 */
@WebServlet("/user-reviews-management")
public class UserReviewsManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		ArrayList<Review> reviews = new ArrayList<>();
		//numberOfStars 
		//index 0 => number of one star
		//index 1 => number of two stars
		// ...
		Integer[] numberOfStars = {0,0,0,0,0};
		
		/***********  MOC ************/
		VAT vat = new VAT(1, 19.5f);
		Product product1 = new Product(1,"Marco computer", "Super ordi de marc.", 2000.4f, "assets/images/products/product-5.jpg",  "video.mp4", true, "très gros","AT5675657", "Gris", 1.2f, 2,50,true,vat);
		Review review1 = new Review(1,"Je suis super content",5,product1,new User());
		Review review2 = new Review(2,"Je suis extra content",5,product1,new User());
		Review review3 = new Review(3,"Je suis content",4,product1,new User());
		Review review4 = new Review(4,"Je suis content deux fois",4,product1,new User());
		Review review5 = new Review(5,"Je suis moyen content",3,product1,new User());
		Review review6 = new Review(6,"Je suis moyen content",3,product1,new User());
		Review review7 = new Review(7,"Je suis moyen content",3,product1,new User());
		Review review8 = new Review(8,"Je suis pas content",2,product1,new User());
		Review review9 = new Review(9,"Je suis pas content",2,product1,new User());
		Review review10 = new Review(10,"Je suis furieux",1,product1,new User());
		Review review11 = new Review(11,"Je suis furieux",1,product1,new User());
		
		reviews.add(review1);
		reviews.add(review2);
		reviews.add(review3);
		reviews.add(review4);
		reviews.add(review5);
		reviews.add(review6);
		reviews.add(review7);
		reviews.add(review8);
		reviews.add(review9);
		reviews.add(review10);
		reviews.add(review11);
		/****************************/
		
		
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
		request.setAttribute("product", product1);
		request.setAttribute("reviews", reviews);
		
		request.getRequestDispatcher("/view/backOffice/userReviewsManagement.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
