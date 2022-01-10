package com.teamproject.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	public String getAuthNumber() {
		Random r = new Random();
		String authNumber = "";
		for(int i = 0; i < 6; i++) {
			authNumber += r.nextInt(10);
		}
		return authNumber;
	}

	// send mail
	public String sendMail(String email, String authNumber, String account) {
		
		// 메일 발송시 필요한 내용
		String host = "smtp.naver.com"; // Simple Mail Transfer Protocol
		int port = 465;
		final String username = account.split("/")[0];
		final String password = account.split("/")[1];
	
		
		// 메일 발송 서버에 대한 인증 및 속성을 설정
		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.trust", host);
		
		Session mailSession = Session.getDefaultInstance(props, new Authenticator() { // javax.mail
			String un = username;
			String pw = password;
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		}); 
		mailSession.setDebug(true); // 메일 보내는 과정의 디버깅을 화면에 출력하기로 설정
		
		String subject = "인증번호 입니다";
		String tag = "<div style=\"font-size: 30px;\">"
					+ "인증번호는 [%s] 입니다"
					+ "</div>";
		String body = String.format(tag, authNumber);
		
		// 메일 보낼 내용
		Message mimeMessage = new MimeMessage(mailSession);
		try {
			// 보내는 사람 주소
			mimeMessage.setFrom(new InternetAddress(username + "@naver.com"));
			
			// 받는 사람 주소
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
			
			mimeMessage.setSubject(subject); // 제목
//			mimeMessage.setText(body); // 내용(단순 텍스트)
			mimeMessage.setContent(body, "text/html; charset=utf-8"); // 내용(HTML)
			
			Transport.send(mimeMessage);
			
		} catch (MessagingException e) {
			System.out.println("주소가 잘못되었습니다.");
		}
		
		return authNumber;
	}
}
