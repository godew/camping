package com.teamproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.teamproject.nonMember.NonMemberDTO;
import com.teamproject.service.NonMemberService;

@Controller
public class NonMemberController {
	@Autowired private NonMemberService nms;
	
	@GetMapping("/nonMembers/{tid}/{notPhone}")
	public String nonMember(@PathVariable String tid, @PathVariable String notPhone, Model model) {
		System.out.println("controller" + tid + ", " + notPhone);
		List<NonMemberDTO> list = nms.selectNonMember(tid, notPhone);
		model.addAttribute("list", list);
		return "/nonMembers/nonMembers";
	}
}
