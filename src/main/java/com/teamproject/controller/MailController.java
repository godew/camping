package com.teamproject.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.teamproject.hash.Hash;
import com.teamproject.service.MailService;

@RestController
//@CrossOrigin(origins = {"http://localhost:8080"})
public class MailController {
	
	@Autowired private MailService mailService;
	@Autowired private Hash hash;
	
	@GetMapping("/mailto/{email}/")
	public HashMap<String, String> mailto(@PathVariable String email, HttpSession session) throws IOException {
		String authNumber = mailService.getAuthNumber();
		String hashNumber = hash.getHash(authNumber);
		
		// account.dat => ID/PW
		String account = null;
		String filePath = session.getServletContext().getRealPath("/resources/account.dat");
		File f = new File(filePath);
		
		Scanner sc = new Scanner(f);
		while(sc.hasNextLine()) {
			account = sc.nextLine();
		}
		sc.close();
		
		String res = mailService.sendMail(email, authNumber, account);
		
		HashMap<String, String> map = new HashMap<>();
		
		if(res.equals(authNumber)) {
			map.put("status", "OK");
			map.put("msg", "인증번호가 발송되었습니다");
		}
		
		// session은 클라이언트 1명당 1개의 객체가 생성되므로 ,세션에 저장해두면 다른 클라이언트와 섞일 일이 없다.
		session.setAttribute("hashNumber", hashNumber);
		
		return map;
	}
	
	@GetMapping("/getAuthResult/{userNumber}/")
	public HashMap<String, String> getAuthResult(@PathVariable String userNumber, HttpSession session) {
		String sessionHash = (String)session.getAttribute("hashNumber");
		String userHash = hash.getHash(userNumber);
		
		HashMap<String, String> map = new HashMap<>();
		if(sessionHash == null) {
			map.put("status", "FAIL");
			map.put("msg", "시간이 초과되었습니다.");
			return map;
		}
		
		boolean flag = sessionHash.equals(userHash);
		
		map.put("status", flag ? "OK" : "FAIL");
		map.put("msg", flag ? "인증이 완료되었습니다" : "인증번호를 다시 확인해주세요");
		
		return map;
	}
	
	@GetMapping("/timeout")
	public void timeout(HttpSession session) {
		session.removeAttribute("hashNumber");
	}
}
