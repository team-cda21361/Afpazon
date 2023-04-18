package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.paypal.api.payments.*;
import com.paypal.base.rest.PayPalRESTException;

import beans.Address;
import beans.Order;
import beans.Order_product;
import beans.PaymentServices;
import beans.Product;
import beans.Review;
import beans.Status;
import beans.User;
import dao.OrderDao;
import dao.Order_productDao;
/**
 * Servlet implementation class ExecutePaymentServlet
 */
@WebServlet("/execute_payment")
public class ExecutePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExecutePaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
 
        System.out.println("payerId: "+payerId);
        System.out.println("paymentId: "+paymentId);
		
        //sql.setFloat(1, order.getTotalPrice());
		//sql.setString(2, order.getPaymentToken());
		//sql.setString(3, order.getTrackingNumber());
		//sql.setInt(4, order.getUser().getId());
		//sql.setInt(5, order.getAddress_delivery().getId());
		//sql.setInt(6, order.getStatus().getId());
        
        // PANIER
        beans.Address adressLL = new beans.Address();        
        beans.Address adressFF = new beans.Address();
        Status status = new Status();
        beans.User usercurrent = new beans.User();
        HttpSession sessionP = request.getSession(true);
        beans.Cart cart_temp = new beans.Cart();
        if ((beans.Cart) sessionP.getAttribute("cart") == null) {
            sessionP.setAttribute("cart", cart_temp);
        }
    
        cart_temp = (beans.Cart) sessionP.getAttribute("cart");
        sessionP.setAttribute("cart", cart_temp);
        usercurrent = (beans.User) sessionP.getAttribute("currentUser");
        String adressL = (String) sessionP.getAttribute("adressL");
        String adressF = (String) sessionP.getAttribute("adressF");
        String token = (String) sessionP.getAttribute("token");
        adressLL.setId(Integer.parseInt(adressL));
        adressFF.setId(Integer.parseInt(adressF));
        status.setId(1);
    	Product product ;

        
        // FIN PANIER
 
        Float totalTT = (float) cart_temp.countPrixProductApresRemise();
        beans.Order order = new beans.Order(totalTT, token, paymentId, usercurrent, adressLL, adressFF, status);
        OrderDao orderDao = new OrderDao();
        int idorder = 0;
        
        if(orderDao.create(order)) {
        	System.out.println("Order sauvegarde correctement...");
        }
        idorder = orderDao.lastId();
        order.setId(idorder);
        System.out.println("ID ORDEN: "+ order.getId());
        Order_product order_product = new Order_product();
        Order_productDao order_productDao = new Order_productDao();
  
        for (beans.Item item : cart_temp.getItems()) {
        	order_product = new Order_product((float) item.getPrixR(), item.getQuantity(), item.getProduct(), order);
        	order_productDao.create(order_product);
		}

        try {
            PaymentServices paymentServices = new PaymentServices();
            com.paypal.api.payments.Payment payment = paymentServices.executePayment(paymentId, payerId);
             
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);

            
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);          
 
            // PANIER
    		sessionP.invalidate();
    	
            request.getRequestDispatcher("/view/paypal_receipt.jsp").forward(request, response);
            
             
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("/view/paypal_error.jsp").forward(request, response);
        }
        
    }
	
}
