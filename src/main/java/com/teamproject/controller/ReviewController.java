package com.teamproject.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.teamproject.member.MemberDTO;
import com.teamproject.review.ReviewDTO;
import com.teamproject.service.ReivewService;
 

@Controller
public class ReviewController {
	
	@Autowired private ReivewService rs;

	@GetMapping("/review/{orderId}")
	public String review(@PathVariable int orderId,HttpSession session, Model model) {
		Object login = session.getAttribute("login");
		List<ReviewDTO>list = rs.selectOrder(orderId);
		model.addAttribute("dto", login);
		model.addAttribute("list", list);
		return "/review/review";
	}
	@PostMapping(value="/review/{orderId}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String writeReview(@PathVariable int orderId,@RequestParam(value ="hm", required = false)HashMap<String, String> hm) {
		int row = rs.writeReview(orderId, hm);
		return "redirect:/";
	}
}
