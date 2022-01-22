package com.teamproject.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
	public String pay(Model model, HttpSession session, @PathVariable String itemRoomId, String checkIn, String checkOut) {
		ItemRoomDTO itemRoomDto = itemRoomService.findById(itemRoomId);
		ItemDTO itemDto = itemService.findById(itemRoomDto.getItemId());
		model.addAttribute("itemName", itemDto.getItemName());
		model.addAttribute("itemRoomName", itemRoomDto.getItemRoomName());
		model.addAttribute("itemRoomPrice", itemRoomDto.getItemRoomPrice());
		model.addAttribute("itemRoomId", itemRoomId);
		model.addAttribute("checkIn", checkIn);
		model.addAttribute("checkOut", checkOut);
		
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
		
		int month1 = Integer.valueOf(order.getCheckIn().substring(0, 2));
		int month2 = Integer.valueOf(order.getCheckOut().substring(0, 2));
		int d1 = Integer.valueOf(order.getCheckIn().substring(2, 4));
		int d2 = Integer.valueOf(order.getCheckOut().substring(2, 4));
		if (month1 == month2) {
			for (int i = d1; i < d2+1; i++) {
				itemRoomService.modifyCalendar(order.getItemRoomId(), month1, i);
			}
		} else {
			for (int i = d1; i < 32; i++) {
				itemRoomService.modifyCalendar(order.getItemRoomId(), month1, i);
			}
			
			for (int i = month1+1; i <= month2-1; i++) {
				for (int j = 1; j < 32; j++) {
					itemRoomService.modifyCalendar(order.getItemRoomId(), i, j);
				}
			}
			
			for (int i = 1; i < d2 + 1; i++) {
				itemRoomService.modifyCalendar(order.getItemRoomId(), month2, i);
			}
		}
		
		session.setAttribute("tid", order.getTid());
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
	
	@GetMapping("/payment/notInfo")
	public String notInfo(Model model, HttpSession session) {
		model.addAttribute("tid", session.getAttribute("tid"));
		
		return "payment/notInfo";
	}
}
