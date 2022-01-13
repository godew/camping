package com.teamproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.member.MemberDTO;
import com.teamproject.point.OrderPointDTO;
import com.teamproject.point.ReviewPointDTO;
import com.teamproject.service.PointService;
import com.teamproject.service.UserinfoService;

@Controller
public class UserInfoController {
	
	@Autowired private UserinfoService us;
	@Autowired private PointService ps;

	@GetMapping("/userInfo")
	public String userinfo() {
		
		return "/userInfo/userinfo";
	}
	@GetMapping(value = "/member/{memberId}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<MemberDTO> member(@PathVariable int memberId) {
		
		List<MemberDTO> data = us.getMember(memberId);
		return data;
	}
	
	
	@GetMapping("/point")
	public String point() {
		return "/userInfo/point";
	}
	@GetMapping(value = "/getOpoint/{memberId}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<OrderPointDTO> getOpoint(@PathVariable int memberId){
		List<OrderPointDTO> list = ps.getOPoint(memberId);
		return list;
	}
	
	@GetMapping(value = "/getRpoint/{memberId}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<ReviewPointDTO> getRpoint(@PathVariable int memberId){
	List<ReviewPointDTO> list = ps.getRPoint(memberId);
	return list;
	}
//	@PostMapping("/userInfo?name={username}")
//	public String nameUpdate(@PathVariable String username) {
//		us.nameUpdate(username);
//		return null;
//	}
	
	
}
