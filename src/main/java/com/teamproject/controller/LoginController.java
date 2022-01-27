package com.teamproject.controller;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.hash.Hash;
import com.teamproject.member.MemberDTO;
import com.teamproject.service.LoginService;

@Controller
public class LoginController {

	@Autowired LoginService ls;
	@Autowired private JoinController jc;
	@Autowired private Hash hash;
	
	@RequestMapping("/login/terms")
	public String terms() {
		return "join/terms";
	}
	
	@RequestMapping("/login/home")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	@PostMapping("/login/login")
	public String login(MemberDTO dto, HttpSession session, String returnURI, String url) {
		MemberDTO login = ls.login(dto);	
		session.setAttribute("login", login);

//		System.out.println(returnURI);
//		System.out.println(login);
//		System.out.println(login == null ? "실패" : "성공 : " + login.getEmail());
		return returnURI == null ? "redirect:" + url : "redirect:" + returnURI + login.getMemberID();

	}
	
	@RequestMapping("/login/nonReservation")
	public String nonReservation() {
		return "login/nonReservation";
	}
	
	@RequestMapping("/findID")
	public String findID() {
		return "login/findID";
	}
	
	@GetMapping("/findID/phoneCheck/{phone}")
	@ResponseBody
	public HashMap<String, String> findIDsms(@PathVariable String phone, HttpSession session, MemberDTO dto) {
		int row = ls.checkPhone(dto);
		HashMap<String, String> res = new HashMap<String, String>();
		if(row == 1) {
			res = jc.sms(phone, session);
		}
		else {
			res.put("phoneCheck", "회원정보가 없습니다.");
			res.put("status", "0");
		}
		return res;
	}
	
	@GetMapping("/findID/auth/{auth}/")
	@ResponseBody
	public HashMap<String, String> auth(@PathVariable String auth, HttpSession session, MemberDTO dto) {
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
	
	@GetMapping("/findID/phone/{sessionData}/")
	@ResponseBody
	public MemberDTO findIDResult(@PathVariable String sessionData, MemberDTO dto) {
		MemberDTO find = ls.findId(dto);
		return find;
	}
}
