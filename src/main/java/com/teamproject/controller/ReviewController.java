package com.teamproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.teamproject.review.ReviewDTO;
import com.teamproject.service.ReivewService;


@Controller
public class ReviewController {
	
	@Autowired private ReivewService rs;

	@GetMapping("/review")
	public String review() {
		
		return "/review/review";
	}
	@RequestMapping(value="/review", method= {RequestMethod.POST}, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String writeReview(@RequestParam("img")MultipartFile img, ReviewDTO dto) {
		int row = rs.writeReview(img, dto);
		
		return "redirect:/";
	}
}
