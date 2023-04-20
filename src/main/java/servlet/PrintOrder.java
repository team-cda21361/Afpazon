package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Order;
import beans.Order_product;
import beans.User;
import dao.OrderDao;
import dao.Order_productDao;
import pdf.GenePdfX;

/**
 * Servlet implementation class PrintOrder
 */
@WebServlet("/printOrder")
public class PrintOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Order_productDao order_productDao = new Order_productDao();
    OrderDao orderDao = new OrderDao();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrintOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		User currentUser = (User) session.getAttribute("currentUser");
		String creationPath = getServletContext().getRealPath("assets/factures/");
		String logoPath = getServletContext().getRealPath("assets/images/logo/Amazon_logo.svg.png");
		ArrayList<Order> ordersList = orderDao.readForUser((User) session.getAttribute("currentUser"));
		if (request.getParameter("orderID") != null) {
			if (Integer.parseInt(request.getParameter("orderID")) > 0) {
				for (Order order : ordersList) {
					if (order.getId() == Integer.parseInt(request.getParameter("orderID"))) {
						Order orderSelected = order;
						ArrayList<Order_product> productsList = order_productDao.readForOrder(orderSelected);
						String pdfPath = GenePdfX.createFacturePDF(currentUser, orderSelected, productsList, creationPath, logoPath);
						response.setContentType("APPLICATION/OCTET-STREAM");
					    response.setHeader("Content-Disposition","attachment; filename=\"" + "afpazon_facture_" + orderSelected.getId()+ ".pdf" + "\""); 
					    response.setHeader("Content-Type","application/force-download"); 
					    response.setHeader("Content-Transfer-Encoding","binary"); 
					    java.io.FileInputStream fileInputStream = new java.io.FileInputStream(pdfPath);
					    ServletOutputStream os = response.getOutputStream();
					    byte[] bufferData = new byte[1024];
					    int i=0; 
					    while ((i=fileInputStream.read(bufferData)) != -1) 
					    {
					    	os.write(bufferData, 0, i);
					    } 
					    os.flush();
						os.close();
					    fileInputStream.close();
					}
				}
			}
		}

		response.sendRedirect("account?showOrderID="+request.getParameter("orderID"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
