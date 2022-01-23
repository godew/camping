package com.teamproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class FilterController {
	
	@GetMapping("/product/search/1")
	public String filterMain() {
		return "/filter/filterMain";
	}

}
