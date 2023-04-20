package pdf;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import beans.Order;
import beans.Order_product;
import beans.User;


public class GenePdfX {
	
	public static String createFacturePDF(User user, Order order, ArrayList<Order_product> productsList, String billsTempPath, String logo) throws FileNotFoundException {
		com.itextpdf.text.Font fontHeader = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK);
		com.itextpdf.text.Font font = FontFactory.getFont(FontFactory.HELVETICA, 12, BaseColor.BLACK);
		
		File folder = new File(billsTempPath);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		String cheminVersPDF = billsTempPath + "afpazon_facture_" + order.getId()+ ".pdf";
		
		try {
			Document document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream(cheminVersPDF));
			document.open();
			try {
				Image img = Image.getInstance(logo);
				img.scaleToFit(150, 50);
				document.add(img);
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			Paragraph p1 = new Paragraph("Afpazon by SPEAR", fontHeader);
			document.add(p1);
			Paragraph p2 = new Paragraph("Siège social\nAfpa Paris Politzer\n75012 Paris\nTéléphone : 01 23 45 67 89\nEmail : contact@afpazon.fr\n", font);
			document.add(p2);
			Paragraph p3 = new Paragraph("Client : ", fontHeader);
			Paragraph p4 = new Paragraph(user.getFirstName() + " " + user.getLastName() + " (Numéro client : " + user.getId() + ")\nEmail : " + user.getEmail() + " / Téléphone : " + user.getPhone(), font);
			p3.setAlignment(com.itextpdf.text.Element.ALIGN_RIGHT);
			p4.setAlignment(com.itextpdf.text.Element.ALIGN_RIGHT);
			document.add(p3);
			document.add(p4);
			
			PdfPTable tableUser = new PdfPTable(2);
			tableUser.setWidthPercentage(100);
			tableUser.setSpacingBefore(10);
			tableUser.setSpacingAfter(10);
			tableUser.addCell("Adresse de livraison :\n" + user.getFirstName() + " " + user.getLastName() + "\n" + order.getAddress_delivery().getAddress() + "\n" + order.getAddress_delivery().getZipCode() + "\n" + order.getAddress_delivery().getCity());
			tableUser.addCell("Adresse de facturation :\n" + user.getFirstName() + " " + user.getLastName() + "\n" + order.getAddress_billing().getAddress() + "\n" + order.getAddress_billing().getZipCode() + "\n" + order.getAddress_billing().getCity());
			document.add(tableUser);
			
			Paragraph p5 = new Paragraph("Détails de la commande n°" + order.getId(), fontHeader);
			p5.setAlignment(com.itextpdf.text.Element.ALIGN_CENTER);
			document.add(p5);
			Paragraph p6 = new Paragraph("Date de la commande : " + order.getDate() + "\nTotal de la commande : " + order.getTotalPrice() + "€\nNombre d'articles : " + productsList.size(), font);
			p6.setAlignment(com.itextpdf.text.Element.ALIGN_CENTER);
			document.add(p6);
			
			PdfPTable tableProducts = new PdfPTable(1);
			tableProducts.setWidthPercentage(100);
			tableProducts.setSpacingBefore(10);
			tableProducts.setSpacingAfter(10);
			for (Order_product product : productsList) {
				tableProducts.addCell(product.getProduct().getName() + "\nRéférence : " + product.getProduct().getReference() + "\nPrix unitaire : " + product.getPrice() + "€\nQuantité : " + product.getQuantity());
			}
			document.add(tableProducts);
			
			Paragraph p7 = new Paragraph("A très bientôt pour une prochaine commande !", fontHeader);
			Paragraph p8 = new Paragraph("Les équipes Afpazon", font);
			p7.setAlignment(com.itextpdf.text.Element.ALIGN_RIGHT);
			p8.setAlignment(com.itextpdf.text.Element.ALIGN_RIGHT);
			document.add(p7);
			document.add(p8);
			document.close();
			
		
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cheminVersPDF;

	}
	
	public static  String createCommadePDf(String name, String reference, String quantity, String appPath) throws FileNotFoundException {
		com.itextpdf.text.Font fontHeader = FontFactory.getFont(FontFactory.COURIER, 24, BaseColor.BLACK);
		com.itextpdf.text.Font font = FontFactory.getFont(FontFactory.COURIER, 16, BaseColor.BLACK);
		
		
		
		String cheminVersPDF = appPath + "Commande.pdf";
		
		try {
			Document document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream(cheminVersPDF ));
			document.open();
			Paragraph p1 = new Paragraph();
//			p1.add("Bonjour M. " + UserDao.currentUser.getNom());
			p1.add("Bonjour M. le fournisseur, nous souhaitons passer commande de(s) produit(s) suivant :");
			p1.setFont(fontHeader);
			document.add(p1);
			Paragraph p2 = new Paragraph();
			p2.add("Nom du produit :  " + name);
			p2.setFont(font);
			document.add(p2);
			Paragraph p3 = new Paragraph();
			p3.add("Référence du produit :  " + reference);
			p3.setFont(font);
			document.add(p3);
			Paragraph p4 = new Paragraph();
			p4.add("Quantité demander :  " + quantity);
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
