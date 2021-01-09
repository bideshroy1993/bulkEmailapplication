import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Mailer {
//public static void send(String to,String subject,String msg)
   // public static void send(String subject,String msg)
         public static void send(String[] names,String subject,String msg,List<File> attachedFiles)
                 throws AddressException, MessagingException
{

final String user="bideshroy93@gmail.com";//change accordingly
final String pass="brajanandan1993";

//1st step) Get the session object	
Properties props = new Properties();
   props.put("mail.smtp.starttls.enable", true); 
props.put("mail.smtp.host", "smtp.gmail.com");//change accordingly
props.put("mail.smtp.auth", "true");

Session session = Session.getInstance(props,
 new javax.mail.Authenticator() {
  protected PasswordAuthentication getPasswordAuthentication() {
   return new PasswordAuthentication(user,pass);
   }
});
//2nd step)compose message
try {
 MimeMessage message = new MimeMessage(session);
 message.setFrom(new InternetAddress(user));
 //useful
 //message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
 
 //useless
// message.addRecipient(Message.RecipientType.TO, InternetAddress.parse("krabsep@gmail.com"));
// message.addRecipient(Message.RecipientType.TO, InternetAddress.parse("krabsep2@gmail.com.com"));
 //useful
//message.addRecipients(Message.RecipientType.TO, 
                  // InternetAddress.parse("krabsep@gmail.com,krabsep2@gmail.com"));
                  
		
	String	str = convertStringArrayToString(names, ",");
message.addRecipients(Message.RecipientType.TO, 
                   InternetAddress.parse(str));
 message.setSubject(subject);
 //useful
// message.setText(msg);
 
  MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent(msg, "text/html");
        
          Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
        
           if (attachedFiles != null && attachedFiles.size() > 0) {
            for (File aFile : attachedFiles) {
                MimeBodyPart attachPart = new MimeBodyPart();
 
                try {
                    attachPart.attachFile(aFile);
                } catch (IOException ex) {
                    ex.printStackTrace();
                }
 
                multipart.addBodyPart(attachPart);
            }
        }
          
             message.setContent(multipart);
 //3rd step)send message
 Transport.send(message);

 System.out.println("Done");

 } catch (MessagingException e) {
	throw new RuntimeException(e);
 }
	
}
         private static String convertStringArrayToString(String[] strArr, String delimiter) {
		StringBuilder sb = new StringBuilder();
		for (String str : strArr)
			sb.append(str).append(delimiter);
		return sb.substring(0, sb.length() - 1);
	}
}
