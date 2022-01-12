package com.teamproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.member.MemberDTO;
import com.teamproject.service.UserinfoService;

@Controller
public class UserInfoController {
	
	@Autowired private UserinfoService us;

	@GetMapping("/userInfo")
	public String userinfo() {
		
		return "/userInfo/userinfo";
	}
	@GetMapping("/point")
	public String point() {
		return "/userInfo/point";
	}
	@GetMapping(value = "/member", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<MemberDTO> member() {
		
		List<MemberDTO> data = us.getMember();
		return data;
	}
	
}
