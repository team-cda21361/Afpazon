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
	
	/* Exemple de code
	public static  String createPDf(Vehicule vehicule, int nbreJours, Date start, Date end, String montant) {
		com.itextpdf.text.Font fontHeader = FontFactory.getFont(FontFactory.COURIER, 24, BaseColor.BLACK);
		com.itextpdf.text.Font font = FontFactory.getFont(FontFactory.COURIER, 16, BaseColor.BLACK);
		
		String cheminVersPDF = "./Facture.pdf";
		
		try {
			Document document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream(cheminVersPDF ));
			document.open();
			Paragraph p1 = new Paragraph();
			p1.add("Bonjour M. " + UserDao.currentUser.getNom());
			p1.setFont(fontHeader);
			document.add(p1);
			Paragraph p2 = new Paragraph();
			p2.add("Votre véhicule :  " + vehicule.getMarque() + " " + vehicule.getModele_vehicule());
			p2.setFont(font);
			document.add(p2);
			Paragraph p3 = new Paragraph();
			p3.add("a été réservé ");
			p3.setFont(font);
			document.add(p3);
			Paragraph p4 = new Paragraph();
			p4.add("du :  " + formatD.format(start) + " au " + formatD.format(end) + "("+nbreJours+" jours)");
			p4.setFont(font);
			document.add(p4);
			Paragraph p5 = new Paragraph();
			p5.add("pour un montant de "+ montant+ "€");
			p5.setFont(fontHeader);
			document.add(p5);
			Paragraph p6 = new Paragraph();
			p6.add("L'agence AVIS vous remercie pour votre confiance");
			p6.setFont(fontHeader);
			document.add(p6);
			document.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cheminVersPDF;

	}
	*/
}
