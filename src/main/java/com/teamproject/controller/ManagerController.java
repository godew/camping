package com.teamproject.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.service.ManagerService;

@Controller
public class ManagerController {
	
	@Autowired private ManagerService managerService;
	
	@GetMapping("/manager")
	public String manager() {
		return "manager/manager";
	}
	
	@GetMapping("/userNumber")
	@ResponseBody
	public HashMap<String, String> userNumber() {
		HashMap<String , String> map = new HashMap<String, String>();
		
		String user = managerService.countUser();
		String notuser = managerService.countNotUser();
		map.put("user", user);
		map.put("notuser", notuser);
		
		return map;
	}
	
	@GetMapping("/userTotal")
	@ResponseBody
	public HashMap<String, String> userTotal(String month, String day) {
		HashMap<String , String> map = new HashMap<String, String>();
		
		String user = managerService.userTotal(month, day);
		String notuser = managerService.notUserTotal(month, day);
		map.put("user", user);
		map.put("notuser", notuser);
		
		return map;
	} 
}

