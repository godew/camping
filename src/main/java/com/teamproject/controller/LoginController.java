package com.teamproject.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		session.removeAttribute("login");
		return "home";
	}
	
	@PostMapping("/login/login")
	public String login(MemberDTO dto, HttpSession session, String returnURI) {
		MemberDTO login = ls.login(dto);	
		session.setAttribute("login", login);
		System.out.println(returnURI);
		System.out.println(login);
		System.out.println(login == null ? "실패" : "성공 : " + login.getEmail());
		return returnURI == null ? "redirect:/" : "redirect:" + returnURI + "/" + login.getMemberID();
	}
	
	@RequestMapping("/login/nonReservation")
	public String nonReservation() {
		return "login/nonReservation";
	}
	
	@RequestMapping("/findID")
	public String findID() {
		return "login/findID";
	}
	
	
}
