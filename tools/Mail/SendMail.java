package Mail;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendMail {
	
	public static boolean sendEmail(String client_email, String cheminVersPDF) {

		System.out.println("email : " + client_email);

		// Recipient's email ID needs to be mentioned.
		String to = client_email;

		// Sender's email ID needs to be mentioned
		String from = "afpazon@outlook.fr";

		// Assuming you are sending email from through gmails smtp
		String host = "smtp.office365.com";

		// Get system properties
		Properties properties = System.getProperties();

		// Setup mail server
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.user", "afpazon@outlook.fr");


		// Get the Session object.// and pass username and password
		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

			protected PasswordAuthentication getPasswordAuthentication() {

				return new PasswordAuthentication("afpazon@outlook.fr", "This!sAPlaceh0lder!"); // mettre son mot de passe

			}

		});

		// Used to debug SMTP issues
		session.setDebug(true);

		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Set Subject: header field
			message.setSubject("Confirmation réservation");
			
            Multipart multipart = new MimeMultipart();

            MimeBodyPart attachmentPart = new MimeBodyPart();

            MimeBodyPart textPart = new MimeBodyPart();
            MimeBodyPart textPart2 = new MimeBodyPart();
            MimeBodyPart textPart3 = new MimeBodyPart();

            try {

                File f =new File(cheminVersPDF);

                attachmentPart.attachFile(f);
                textPart.setText("Cher client,");
                textPart2.setText("Merci d'avoir choisi Afpazon pour vous enrichir d'objets toujours plus utiles à nos vie./n"
                        + "Veuillez trouver ci-joint la facture correspondant à votre achat.");
                textPart3.setText("La direction.");
                multipart.addBodyPart(textPart);
                multipart.addBodyPart(textPart2);
                multipart.addBodyPart(textPart3);
                multipart.addBodyPart(attachmentPart);

            } catch (IOException e) {

                e.printStackTrace();

            }
            
            message.setContent(multipart);

			// Now set the actual message

			System.out.println("sending...");
			// Send message
			Transport.send(message);
			System.out.println("Sent message successfully....");
			return true;
		} catch (MessagingException mex) {
			System.out.println("**************************************");
			mex.printStackTrace();
			return false;
		}

	}

}