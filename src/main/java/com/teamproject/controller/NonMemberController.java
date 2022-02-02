package com.teamproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamproject.nonMember.NonMemberDTO;
import com.teamproject.service.NonMemberService;
import com.teamproject.service.OrderService;

@Controller
public class NonMemberController {
	@Autowired private NonMemberService nms;
	@Autowired private OrderService os;
	
	@GetMapping("/nonMembers/{tid}/{notPhone}")
	public String nonMember(@PathVariable String tid, @PathVariable String notPhone, Model model) {
		System.out.println("controller" + tid + ", " + notPhone);
		List<NonMemberDTO> list = nms.selectNonMember(tid, notPhone);
		model.addAttribute("list", list);
		return "/nonMembers/nonMembers";
	}
	@PostMapping("/nonMembers/{tid}/{notPhone}")
	public String nonMemberDel(@RequestParam int orderId) {
		int row = os.orderCancle(orderId);
		return"redirect:/";
	}
}
