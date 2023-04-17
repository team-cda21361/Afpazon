package servlet;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;

import beans.Stock;
import dao.StockDao;
import pdf.GenePdf;

/**
 * Servlet implementation class Stockmanager
 */
@WebServlet("/stock-management")
public class StockManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       StockDao stockDao = new StockDao();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StockManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
//************************ HYDRATER LE FORMULAIRE ****************************
		if (request.getParameter("idEdit")!=null) {
			Stock stock = stockDao.findById(Integer.parseInt(request.getParameter("idEdit")));
			request.setAttribute("stockEdit", stock);
		}
		
//************************ SUPPRIMER UN STOCK ****************************
		else if (request.getParameter("idDelete")!=null) {
			System.out.println();
			Stock stock = stockDao.findById(Integer.parseInt(request.getParameter("idDelete")));
			request.setAttribute("stockDelete", stockDao.delete(stock));
			System.err.println("DELETE OKAY !!!!"); 
			
		}
		
//************************ POINTER ET AFFICHER LA BONN PAGE JSP ****************************
		else {
			
		}
//************************ HYDRATER LE TABLEAU ****************************
		request.setAttribute("stockList", stockDao.read());
		
		request.getRequestDispatcher("/view/backOffice/stockManagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
//************************ RECUP POUR LA COMMANDE DE STOCK *********************************
		if (request.getParameter("sendForStock")!=null) {
			String provider = request.getParameter("provider");
			String reference = request.getParameter("reference");
			int quantity =Integer.parseInt(request.getParameter("quantity")) ;
		
			String imagePath=getServletContext().getRealPath("/assets/image/logo/white-logo.svg");
			String uploadPath=getServletContext().getRealPath("/assets/mail/");
			//String uploadPath=getServletContext().getRealPath("/WEB-INF/lib/commandeStock.pdf");
			//FileOutputStream outputstream= new FileOutputStream(new File(uploadPath));
		
			System.out.println(uploadPath);
			response.setContentType("application/pdf");
			String result =GenePdf.sendPdf(provider, reference, quantity, uploadPath);
			System.out.println(result);
			
			
			
			
		}
		
//************************ RENVOYER LE CONTENUE DU doPost VERS LE doGet  *********************************
		doGet(request, response);
	}

}
