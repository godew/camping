package com.teamproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping("/join/terms")
	public String terms() {
		return "join/terms";
	}
	
	@RequestMapping("/join/verification")
	public String authentication() {
		return "join/verification";
	}
}
