package com.teamproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/login/login")
	public String login() {
		return "login/login";
	}
	
	@RequestMapping("/login/{nonReservation}")
	public String nonReservation(@PathVariable String returnUrl) {
		return "login/login/" + returnUrl;
	}
}
