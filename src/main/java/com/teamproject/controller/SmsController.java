package com.teamproject.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.hash.Hash;
import com.teamproject.service.SmsService;

@Controller
public class SmsController {

	@Autowired private SmsService smsService;
	@Autowired private Hash hash;
	
	@GetMapping("/sms/send")
	@ResponseBody
	public HashMap<String, String> sms(String phone, HttpSession session) {
		String authNumber = smsService.getAuthNumber();
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
	
	@GetMapping("/sms/getAuthResult/{userNumber}/")
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
	
	@GetMapping("/sms/timeout")
	public void timeout(HttpSession session) {
		session.removeAttribute("hashNumber");
	}
}
