package com.teamproject.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.hash.Hash;
import com.teamproject.service.JoinService;

@Controller
public class JoinController {
	
	@Autowired private JoinService js;
	@Autowired private Hash hash;
	
	@RequestMapping("/join/terms")
	public String terms() {
		return "join/terms";
	}
	
	@RequestMapping("/join/verification")
	public String authentication() {
		return "join/verification";
	}
	
	@GetMapping("/verification/authNum/{pnum}/")
	@ResponseBody
	public HashMap<String, String> sms(@PathVariable String pnum, HttpSession session) {
		String authNumber = js.getAuthNumber();
		String hashNumber = hash.getHash(authNumber);
		
		HashMap<String, String> res = new HashMap<>();
		
		if (js.sendMsg(pnum, authNumber)) {
			res.put("status", "OK");
			res.put("msg", "인증번호가 발송되었습니다");
			session.setAttribute("hashNumber", hashNumber);
		} else {
			res.put("status", "FAIL");
		}
		
		return res;
	}
	
	@GetMapping("/vertification/auth/{auth}/")
	@ResponseBody
	public HashMap<String, String> auth(@PathVariable String auth, HttpSession session) {
		String hashNumber = (String)session.getAttribute("hashNumber");
		String authHash = hash.getHash(auth);
		boolean result = hashNumber.equals(authHash);
		HashMap<String, String> resultHash = new HashMap<String, String>();
		if(result) {
			resultHash.put("status", "1");
			resultHash.put("msg", "인증되었습니다.");
		}
		else {
			resultHash.put("status", "0");
			resultHash.put("msg", "인증번호가 틀립니다.");
		}
		return resultHash;
	}
	
	@GetMapping("/join/member")
	public String member() {
		return "join/member";
	}
	
}
