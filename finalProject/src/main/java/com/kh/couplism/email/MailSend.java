package com.kh.couplism.email;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {
	public static void main(String[] args) {
		
		Properties prop=System.getProperties();
		
		prop.put("mail.smtp.host","smtp.naver.com");
		prop.put("mail.smtp.port",465);
		prop.put("mail.smtp.auth","true");
		prop.put("mail.smtp.ssl.enable","true");
		prop.put("mail.smtp.ssl.trust","smtp.naver.com");
		prop.put("mail.transport.protocol","smtp" );
		
		//Session
		MailAuth auth=new MailAuth();
		Session session = Session.getDefaultInstance(prop,auth);
		
		try {
			MimeMessage message = new MimeMessage(session);
			
			//송신자
			message.setFrom(new InternetAddress("couplism@naver.com","COUPLISM"));
			
			//수신자
			InternetAddress to = new InternetAddress("kmj48500@naver.com");
			
			message.setRecipient(Message.RecipientType.TO, to);
			message.setSubject("커플리즘 이메일 인증","UTF-8");
			message.setText("안녕하세요 커플리즘 이메일 인증번호입니다."
					+ "\n인증번호 : 001000"
					+ "\n인증번호를 회원가입하시는 창 이메일 인증 칸안에 적어주세요.","UTF-8");
			
			Transport.send(message);
			System.out.println("message 보내기 성공");
		}catch(AddressException ae) {
			System.out.println("AddressException : "+ae);
		}catch(MessagingException me) {
			System.out.println("MessageException : "+me.getMessage());
		}catch(UnsupportedEncodingException e) {
			System.out.println("UnsupportedEncodingException : "+e.getMessage());
		}finally {
			System.out.println("try 문장 실행 check");
		}
		
		
		
	}		
}

