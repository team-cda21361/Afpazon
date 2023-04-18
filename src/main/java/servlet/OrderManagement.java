
package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mail.SendMail;
import beans.Order;
import beans.Order_product;
import beans.Status;
import beans.User;
import dao.OrderDao;
import dao.Order_productDao;
import dao.UserDao;

/**
 * Servlet implementation class OrderManagement
 */
@WebServlet("/order-management")
public class OrderManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Order_productDao orderProdDao = new Order_productDao(); 
       OrderDao orderDao=new OrderDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("deleteOption")!=null) {
			int orderProdId = Integer.parseInt(request.getParameter("orderProdId"));
			Order_product orderProduct = orderProdDao.findById(orderProdId);
			System.out.println(orderProduct.getId());
			if (!orderProdDao.delete(orderProduct)) {
				request.setAttribute("error", "le produit "+orderProduct.getProduct().getName()+ " n'a pas pu être effacé");
			}
			
		}
		if (request.getParameter("deleteAllOption")!=null) {
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			Order order = orderDao.findById(orderId);
			if (!orderDao.delete(order)) {
				request.setAttribute("error", "La commande n'a pas pu être effacée");
			}
			response.sendRedirect("dashboard");
		}
//		resend the bill to the custumer
		if (request.getParameter("reSendOption")!=null) {
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			Order order = orderDao.findById(orderId);
			String creationPath = getServletContext().getRealPath("assets/factures/");
			String cheminVersPDF = creationPath + "afpazon_facture_" + orderId+ ".pdf";
			
			if (SendMail.sendEmail(order.getUser().getEmail(), cheminVersPDF)) {
				
				request.setAttribute("success", "La commande n° "+order.getId()+" a bien été envoyée à l'adresse : "+order.getUser().getEmail());
			}else {
				request.setAttribute("error", "Oups!! la commande n° "+order.getId()+" n'a pas pu être envoyée à l'adresse : "+order.getUser().getEmail());
				
			}
			
			
		}
		
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		Order order = orderDao.findById(orderId);
		
		
		
		

		
		/******************************************************/
		
		
		request.setAttribute("orderProd", orderProdDao.findByOrderId(orderId));
		request.setAttribute("order", order);
		
		
		request.getRequestDispatcher("/view/backOffice/orderManagement.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
