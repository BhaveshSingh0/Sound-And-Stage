/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author Bhavesh Singh
 */
public class SendMail {
    
    
    public int send( String emailAddress , String firstName ){
        
        
        
                 Random rnd = new Random();
                 int n = 100000 + rnd.nextInt(900000); 
                    
                    
		String host = "smtp.gmail.com";
        String port = "587";
        String mailFrom = "bhaveshsingh322@gmail.com";
        String password1 = "Bhaveshsingh@72199616110";
        String mailTo = emailAddress;
        String subject = "OTP(One Time Password)";
        String message = "Thank you "+firstName+" , Registering to the Sound And Stage Entertainment , your OTP is "+n ;
		 try {
		
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.user", mailFrom);
        properties.put("mail.password", password1);
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(mailFrom, password1);
            }
        };
        Session session1 = Session.getInstance(properties, auth);
         Message msg = new MimeMessage(session1);
        msg.setFrom(new InternetAddress(mailFrom));
        InternetAddress[] toAddresses = { new InternetAddress(mailTo) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
  
        msg.setSentDate(new Date());
        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent(message, "text/html");
         Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
	 msg.setContent(multipart);
	Transport.send(msg);
        
                  
        
        
        }
                 
                 catch (Exception ex) {
           
         return  1 ;
        }
                 
                 
            return n;     
                 
    }
    
    
    
    
}
