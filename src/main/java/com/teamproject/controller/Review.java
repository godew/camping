package com.teamproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Review {

	@GetMapping("/review")
	public String review() {
		
		return "/review/review";
	}
	
	
}
