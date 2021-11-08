package mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

class MailAuth extends Authenticator{
	
	PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "jspstudy2";
        String mail_pw = "jspstudy2001";
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
  
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }

}

public class MailSendPW {
	public static void pwMailSend(String mail) {

		Properties prop = System.getProperties();

		// �α��ν� TLS�� ����� ������ ����
		prop.put("mail.smtp.starttls.enable", "true");

		// �̸��� �߼��� ó������ SMTP����
		prop.put("mail.smtp.host", "smtp.gmail.com");

		// SMTP ������ ������ ����Ѵٴ� �ǹ�
		prop.put("mail.smtp.auth", "true");

		// TLS�� ��Ʈ��ȣ�� 587�̸� SSL�� ��Ʈ��ȣ�� 465�̴�.
		prop.put("mail.smtp.port", "587");

		// soket������ protocol���� �ذ�
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		prop.put("mail.smtp.socketFactory.fallback", "false");
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Authenticator auth = new MailAuth();

		Session session = Session.getDefaultInstance(prop, auth);

		MimeMessage msg = new MimeMessage(session);

		try {
			// ������ ��¥ ����
			msg.setSentDate(new Date());

			// �߼��ڸ� �����Ѵ�. �߼����� ����, �߼��ڸ�
			msg.setFrom(new InternetAddress("jspstudy2@gmail.com", "���¾߰ź���"));

			// �������� ������ �����Ѵ�.
			InternetAddress to = new InternetAddress(mail);

			msg.setRecipient(Message.RecipientType.TO, to);


			String mailSubject = "�׽�Ʈ1";
			String mailText = "�׽�Ʈ2";

			// ������ ���� ����
			msg.setSubject(mailSubject, "UTF-8");
			// Transport�� ������ ���������� ������ Ŭ������ ������ ������ �κ��̴�.
			msg.setText(mailText, "UTF-8");
			Transport.send(msg);
		} catch (AddressException ae) {
			System.out.println("AddressException : " + ae.getMessage());
		} catch (MessagingException me) {
			System.out.println("MessagingException : " + me.getMessage());
		} catch (UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : " + e.getMessage());
		}
	}
	
	public static void main(String[] args) {
		pwMailSend("simba222@naver.com");
		System.out.println("hi~~");
	}
}
