package com.teamproject.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/login/login")
	public String login(Model model, HttpServletRequest req, HttpSession session) { 
		if (session.getAttribute("login") != null) {
			return "redirect:/";
		}
		model.addAttribute("url", req.getHeader("REFERER"));
		// asdfsadf
		return "login/login";
	}
}
