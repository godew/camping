package com.teamproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserInfoController {

	@GetMapping("/userInfo")
	public String userinfo() {
		
		return "/userInfo/userinfo";
	}
	@GetMapping("/point")
	public String point() {
		return "/userInfo/point";
	}
	
	
}
