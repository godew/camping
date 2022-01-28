package com.teamproject.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/login/login")
	public String login(Model model, HttpServletRequest req) { 

		model.addAttribute("url", req.getHeader("REFERER"));
		// asdfsadf
		return "login/login";
	}
}
