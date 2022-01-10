package com.teamproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FilterController {

	@GetMapping("/filterMain")
	public String filterMain() {
		return "/filter/filterMain";
	}
}
