package com.teamproject.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.hash.Hash;
import com.teamproject.service.MailService;
import com.teamproject.service.PaymentService;
import com.teamproject.service.SmsService;

@Controller
public class PaymentController {

	@Autowired private PaymentService paymentService;
	@Autowired private SmsService smsService;
	@Autowired private MailService mailService;
	@Autowired private Hash hash;
	
	@GetMapping("/payment")
	public String pay() {
		return "payment/pay";
	}
	
	@GetMapping(value = "/ready", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String ready(HttpSession session) throws IOException {
		String res = paymentService.ready();
		session.setAttribute("tid", res.split("\"")[3]);
		return res;
	}
	
	@GetMapping("/approve")
	public String approve(HttpSession session, String pg_token) throws IOException {
		paymentService.approve(session.getAttribute("tid").toString(), pg_token);
		return "payment/pay";
	}
	
	@GetMapping("/cancel")
	@ResponseBody
	public String cancel(HttpSession session) throws IOException {
		// db의 tid가져와야 한다 지금은 test용으로 session에서 가져옴
		return paymentService.cancel(session.getAttribute("tid").toString());
	}
	
	@GetMapping("/sms")
	@ResponseBody
	public HashMap<String, String> sms(String phone, HttpSession session) {
		String authNumber = mailService.getAuthNumber();
		String hashNumber = hash.getHash(authNumber);
		
		HashMap<String, String> res = new HashMap<>();
		
		if (smsService.sendMsg(phone, authNumber)) {
			res.put("status", "OK");
			res.put("msg", "인증번호가 발송되었습니다");
			session.setAttribute("hashNumber", hashNumber);
		} else {
			res.put("status", "FAIL");
		}
		
		return res;
	}
	
	@GetMapping("/getAuthResult/{userNumber}/")
	@ResponseBody
	public HashMap<String, String> getAuthResult(@PathVariable String userNumber, HttpSession session) {
		String sessionHash = (String)session.getAttribute("hashNumber");
		String userHash = hash.getHash(userNumber);
		HashMap<String, String> res = new HashMap<>();
		
		if(sessionHash == null) {
			res.put("status", "FAIL");
			res.put("msg", "시간이 초과되었습니다.");
			return res;
		}
		
		boolean flag = sessionHash.equals(userHash);
		
		res.put("status", flag ? "OK" : "FAIL");
		res.put("msg", flag ? "인증이 완료되었습니다" : "인증번호를 다시 확인해주세요");
		
		return res;
	}
	
	@GetMapping("/timeout")
	public void timeout(HttpSession session) {
		session.removeAttribute("hashNumber");
	}
}
