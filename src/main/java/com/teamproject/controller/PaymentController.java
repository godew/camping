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
import com.teamproject.member.MemberDTO;
import com.teamproject.order.OrderDTO;
import com.teamproject.service.ItemRoomService;
import com.teamproject.service.ItemService;
import com.teamproject.service.OrderService;
import com.teamproject.service.PaymentService;
import com.teamproject.service.UserinfoService;

@Controller
public class PaymentController {

	@Autowired private PaymentService paymentService;
	@Autowired private ItemRoomService itemRoomService;
	@Autowired private ItemService itemService;
	@Autowired private OrderService orderService;
	@Autowired private UserinfoService userinfoService;
	
	@GetMapping("/payment/{itemRoomId}")
	public String pay(Model model, HttpSession session, @PathVariable String itemRoomId) {
		ItemRoomDTO itemRoomDto = itemRoomService.findById(itemRoomId);
		ItemDTO itemDto = itemService.findById(itemRoomDto.getItemId());
		model.addAttribute("itemName", itemDto.getItemName());
		model.addAttribute("itemRoomName", itemRoomDto.getItemRoomName());
		model.addAttribute("itemRoomPrice", itemRoomDto.getItemRoomPrice());
		model.addAttribute("itemRoomId", itemRoomId);
		
		return "payment/pay";
	}
	
	@GetMapping(value = "/payment/ready", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String ready(HttpSession session, String point, String itemName, OrderDTO order) throws IOException {

		String res = paymentService.ready(itemName, order.getOrderPrice());

		order.setTid(res.split("\"")[3]);
		session.setAttribute("order", order);
		session.setAttribute("point", point);
		
		return res;
	}
	
	@GetMapping(value = "/payment/notReady", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String notReady(HttpSession session, String itemName, OrderDTO order) throws IOException {

		String res = paymentService.ready(itemName, order.getOrderPrice());

		order.setTid(res.split("\"")[3]);
		session.setAttribute("order", order);
		
		return res;
	}
	
	@GetMapping("/payment/approve")
	public String approve(HttpSession session, String pg_token) throws IOException {
		OrderDTO order = (OrderDTO)session.getAttribute("order");
		paymentService.approve(order.getTid(), pg_token);
		
		if (session.getAttribute("login") == null) {
			orderService.addNot(order);
			
		} else {
			orderService.add(order);
			// 구매금액의 10%를 point로 전환
			int point;
			if (session.getAttribute("point") == null) {
				point = order.getOrderPrice() / 10;
			} else {
				point = Integer.valueOf(session.getAttribute("point").toString()) + (order.getOrderPrice() / 10);			
			}
			
			userinfoService.modifyPoint(order.getMemberId(), point);
			((MemberDTO)session.getAttribute("login")).setPoint(point);
			
			session.removeAttribute("point");
		}
		
		session.removeAttribute("order");
		return "payment/approve";			
	}
	
	@GetMapping("/payment/cancel")
	@ResponseBody
	public String cancel(HttpSession session) throws IOException {
		// db의 tid가져와야 한다 지금은 test용으로 session에서 가져옴
		return paymentService.cancel(session.getAttribute("tid").toString());
	}
	
	@GetMapping("/payment/close")
	public String close() {
		return "payment/close";
	}
}
