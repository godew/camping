package com.teamproject.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.item.ItemDTO;
import com.teamproject.itemRoom.ItemRoomDTO;
import com.teamproject.service.ItemRoomService;
import com.teamproject.service.ItemService;
import com.teamproject.service.PaymentService;

@Controller
public class PaymentController {

	@Autowired private PaymentService paymentService;
	@Autowired private ItemRoomService itemRoomService;
	@Autowired private ItemService itemService;
	
	@GetMapping("/payment/{itemRoomId}")
	public String pay(Model model, HttpSession session, @PathVariable String itemRoomId) {
		ItemRoomDTO itemRoomDto = itemRoomService.findById(itemRoomId);
		ItemDTO itemDto = itemService.findById(itemRoomDto.getItemId());
		model.addAttribute("itemName", itemDto.getItemName());
		model.addAttribute("itemRoomName", itemRoomDto.getItemRoomName());
		model.addAttribute("itemRoomPrice", itemRoomDto.getItemRoomPrice());
		
		return "payment/pay";
	}
	
	@GetMapping(value = "/payment/ready", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String ready(HttpSession session) throws IOException {
		String res = paymentService.ready();
		session.setAttribute("tid", res.split("\"")[3]);
		return res;
	}
	
	@GetMapping("/payment/approve")
	public String approve(HttpSession session, String pg_token) throws IOException {
		paymentService.approve(session.getAttribute("tid").toString(), pg_token);
		return "payment/pay";
	}
	
	@GetMapping("/payment/cancel")
	@ResponseBody
	public String cancel(HttpSession session) throws IOException {
		// db의 tid가져와야 한다 지금은 test용으로 session에서 가져옴
		return paymentService.cancel(session.getAttribute("tid").toString());
	}
}
