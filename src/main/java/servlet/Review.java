package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.User;
import dao.ProductDao;
import dao.ReviewDao;

/**
 * Servlet implementation class Review
 */
@WebServlet("/review")
public class Review extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProductDao productDao = new ProductDao();
	ReviewDao reviewDao = new ReviewDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Review() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int productID = Integer.parseInt(request.getParameter("productID"));
		beans.Product selectedProduct = productDao.findById(productID);
		request.setAttribute("selectedProduct", selectedProduct);
		beans.Review review = reviewDao.findUserReviewForProduct((User) session.getAttribute("currentUser"), selectedProduct);
		if (review != null) {
			request.setAttribute("review", review);
		}
		request.getRequestDispatcher("/view/review.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (Integer.parseInt(request.getParameter("starsRating")) > 0) {
			if (request.getParameter("reviewAction").equals("update")) {
				if (reviewDao.update(new beans.Review(Integer.parseInt(request.getParameter("reviewID")), request.getParameter("reviewTextarea"), Integer.parseInt(request.getParameter("starsRating")), productDao.findById(Integer.parseInt(request.getParameter("productID"))), (beans.User) session.getAttribute("currentUser")))) {
					request.setAttribute("message", "Votre avis a bien été mis à jour !");
					doGet(request, response);
				} else {
					request.setAttribute("message", "Erreur : une erreur est survenue lors de la mise à jour de votre avis.");
					doGet(request, response);
				}
			} else if (request.getParameter("reviewAction").equals("create")) {
				if (reviewDao.create(new beans.Review(request.getParameter("reviewTextarea"), Integer.parseInt(request.getParameter("starsRating")), productDao.findById(Integer.parseInt(request.getParameter("productID"))), (beans.User) session.getAttribute("currentUser")))) {
					response.sendRedirect("product?id=" + productDao.findById(Integer.parseInt(request.getParameter("productID"))).getId());
				} else {
					request.setAttribute("message", "Erreur : une erreur est survenue lors de la création de votre avis.");
					doGet(request, response);
				}
			}
		} else {
			request.setAttribute("message", "Erreur : vous ne pouvez pas laisser un avis sans note.");
			doGet(request, response);
		}
	}

}
