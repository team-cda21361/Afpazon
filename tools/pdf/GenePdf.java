package pdf;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.Date;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;


public class GenePdf {
	
	public static String createFacturePDF(Order order, ArrayList<Order_product> productsList, String appPath) throws FileNotFoundException {
		com.itextpdf.text.Font fontHeader = FontFactory.getFont(FontFactory.COURIER, 24, BaseColor.BLACK);
		com.itextpdf.text.Font font = FontFactory.getFont(FontFactory.COURIER, 16, BaseColor.BLACK);
		
		String cheminVersPDF = appPath + "afpazon_facture_" + order.getID() + ".pdf";
		
		try {
			Document document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream(cheminVersPDF));
			document.open();
//			ImageData imageData = ImageDataFactory.create(appPath + "/image.jpg");
			Paragraph p1 = new Paragraph();
			p1.add("Bonjour M. le fournisseur, nous souhaitons passer commande de(s) produit(s) suivant :");
			p1.setFont(fontHeader);
			document.add(p1);
			Paragraph p2 = new Paragraph();
			p2.add("Nom du produit :  ");
			p2.setFont(font);
			document.add(p2);
			Paragraph p3 = new Paragraph();
			p3.add("Référence du produit :  ");
			p3.setFont(font);
			document.add(p3);
			Paragraph p4 = new Paragraph();
			p4.add("Quantité demander :  ");
			p4.setFont(font);
			document.add(p4);
			Paragraph p5 = new Paragraph();
			p5.add("AFPAZON vous remercie pour votre confiance,");
			p5.setFont(fontHeader);
			document.add(p5);
			Paragraph p6 = new Paragraph();
			p6.add("Cordialement, Peace and love !");
			p6.setFont(fontHeader);
			document.add(p6);
			document.close();
			
		
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cheminVersPDF;

	}
}
