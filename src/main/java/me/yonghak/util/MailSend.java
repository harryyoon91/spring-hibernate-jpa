package me.yonghak.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {
public void sendmailForHtml(String title, String target, String content) {
		
		String from = "harryyoon91@gmail.com";
		
		Properties properties = new Properties();
		
		properties.put("mail.smtp.host","smtp.gmail.com");
		
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.debug", "true");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.socketFactory.fallback", "false");
		
		try {
			Authenticator auth = new SMTPAuthenticator();
			
			Session mailSession = Session.getInstance(properties,auth);
			
			mailSession.setDebug(true);
			
			Message message = new MimeMessage(mailSession);
			
			// Set From
			message.setFrom(new InternetAddress(from));
			
			// Set To
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(target));
			
			message.setSubject(title);
			
			message.setContent(content, "text/html;charset=utf-8");
			
			// send Message
			Transport.send(message);
			
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	public void sendmail(String title,String target,String content) {
		
		String from = "harryyoon91@gmail.com";
		
		Properties properties = new Properties();
		
		properties.put("mail.smtp.host","smtp.gmail.com");
		
		properties.put("mail.smtp.port", "465");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.debug", "true");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.socketFactory.fallback", "false");
		
		try {
			
			Authenticator auth = new SMTPAuthenticator();
			
			Session mailSession = Session.getInstance(properties,auth);
			
			mailSession.setDebug(true);

			Message message = new MimeMessage(mailSession);
			
			// Set From
			message.setFrom(new InternetAddress(from));
			
			// Set To
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(target));
			
			message.setSubject(title);
			
			message.setContent(content, "text/html;charset=utf-8");
			
			// send Message
			Transport.send(message);
			
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
