package com.teamproject.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamproject.member.MemberDTO;
import com.teamproject.service.LoginService;

@Controller
public class LoginController {

	@Autowired LoginService ls;
	
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
		session.invalidate();
		return "home";
	}
	
	@PostMapping("/login/login")
	public String login(MemberDTO dto, HttpSession session, String url) {
		MemberDTO login = ls.login(dto);		// DB에서 받아온 계정을
		session.setAttribute("login", login);	// 현재 세션에 저장
		System.out.println(login == null ? "실패" : "성공 : " + login.getEmail());
		return url == null ? "redirect:/" : "redirect:" + url;
	}

}
