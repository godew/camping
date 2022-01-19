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
	
	@PostMapping("/login")
	public String loginHome(HttpSession session, MemberDTO dto) {
		MemberDTO login = ls.login(dto);
		session.setAttribute("login", login);
		
		return "redirect:/";
	}
}
