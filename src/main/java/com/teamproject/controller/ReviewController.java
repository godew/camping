package com.teamproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamproject.review.ReviewDTO;
import com.teamproject.service.ReivewService;
 

@Controller
public class ReviewController {
	
	@Autowired private ReivewService rs;

	@GetMapping("/review/{orderId}")
	public String review(@PathVariable int orderId, HttpSession session, Model model) {
		Object login = session.getAttribute("login");
		List<ReviewDTO>list = rs.selectOrder(orderId);
		model.addAttribute("dto", login);
		model.addAttribute("list", list);
		return "/review/review";
	}
	@PostMapping("/review/{orderId}")
	public String writeReview(@PathVariable int orderId,
			@RequestParam(value ="starPoint", required = false) int starPoint,
			@RequestParam(value = "memberId", required = false)int memberId,
			@RequestParam(value = "itemId", required = false)int itemId,
			@RequestParam(value = "itemRoomId", required = false)int itemRoomId,
			@RequestParam(value = "title", required = false)String title,
			@RequestParam(value = "content", required = false)String content) {
		int row = rs.writeReview(orderId, starPoint, memberId, itemId, itemRoomId, title, content);
		
		return "redirect:/";
	}
}
