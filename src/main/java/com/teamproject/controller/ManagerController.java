package com.teamproject.controller;

import java.util.HashMap;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.service.ManagerService;
import com.teamproject.chat.ChatComponent;

@Controller
public class ManagerController {
	
	@Autowired private ManagerService managerService;
	@Autowired private ChatComponent chatComponent;
	
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
	
	@PostMapping("/testchat")
	public String testchat(String username, HttpSession session) {
		session.setAttribute("username", username);
		return "manager/testest";
	}
	
	@GetMapping("/list")
	@ResponseBody
	public Set<String> list() {
		return chatComponent.getSessionList().keySet();
	}
}

