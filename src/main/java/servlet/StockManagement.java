package servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Mail.SendMail;
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
			String name = request.getParameter("name");
			String reference = request.getParameter("reference");
			String quantity = request.getParameter("quantity");
			
//**************************** FAIRE UN CHEMIN EPHEMERE POUR L UPLOAD DE PDF (.metadata) ***********************
			String uploadPath = getServletContext().getRealPath("assets/");
			
//**************************** APPELER ET GENERER LE PDF ******************************************
			String pdfPath = GenePdf.createCommadePDf(name,reference,quantity,uploadPath);
			//String pdfPath = GenePdf.createFacturePDF(name,reference,quantity,uploadPath);
			
			//System.out.println(pdfPath);
			System.out.println("PDF OKAY !!!");
			System.out.println("Fournisseur = "+name+" *** "+"Référence = "+reference+" *** "+"Quantité = "+quantity);
			
//**************************** ENVOIE DU MAIL ******************************************
				if (SendMail.sendEmail("bourgin.fabien@orange.fr", pdfPath)) {
					request.setAttribute("success","La commande a bien été expédiée!");
				}else {
					request.setAttribute("error","La commande n'a pas pu être expédiée!");
					}
			}
			
		
//************************ RENVOYER LE CONTENUE DU doPost VERS LE doGet  *********************************
		doGet(request, response);
	}


}
