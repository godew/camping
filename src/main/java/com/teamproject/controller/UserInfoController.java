package com.teamproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.order.OrderDTO;
import com.teamproject.point.PointDTO;
import com.teamproject.reservation.reservationDTO;
import com.teamproject.service.OrderService;
import com.teamproject.service.PointService;
import com.teamproject.service.ReservationeService;
import com.teamproject.service.UserinfoService;

@Controller
public class UserInfoController {
	
	@Autowired private UserinfoService us;
	@Autowired private PointService ps;
	@Autowired private ReservationeService rs;
	@Autowired private OrderService os;
	
	@GetMapping("/userInfo/{memberID}")
	public String userinfo(@PathVariable String memberID, Model model, HttpSession session) {
		
		Object dto = session.getAttribute("login");
		
		model.addAttribute("dto", dto);
		return "/userInfo/userinfo";
	}
	
	@PostMapping("/userInfo/{memberId}")
	public String userNameUpdate(@RequestParam(value = "phone", required = false) String phone, @RequestParam(value = "name", required = false) String name, @PathVariable String memberId, HttpSession session) {
		int row = 0;
		
		if(name != null) {
		row = us.updateName(name, memberId);
		}
		if(phone != null) {
		row = us.updatePhone(phone, memberId);
		}
		session.invalidate();
		return "redirect:/";
	}
	

	@GetMapping("/point/{memberID}")
	public String point(@PathVariable int memberID, Model model, HttpSession session) {
		Object dto = session.getAttribute("login");
		System.out.println("dto :" + dto);
		System.out.println("session :" + session);
		model.addAttribute("dto", dto);
		return "/userInfo/point";
	}
	
	@GetMapping(value = "/getpoint/{memberId}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<PointDTO> getRpoint(@PathVariable int memberId){
	List<PointDTO> list = ps.getPoint(memberId);
	return list;
	}
	
	@GetMapping("/reservation/")
	public String reservation(Model model, HttpSession session) {
		return reservation(-1, model, session);
	}

	@GetMapping("/reservation/{memberId}")
	public String reservation(@PathVariable int memberId, Model model, HttpSession session) {
		List<reservationDTO> list = rs.getReservation(memberId);
		Object dto = session.getAttribute("login");
		String name = us.getName(memberId);
		model.addAttribute("name", name);
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		System.out.println(list);
		return "/userInfo/reservation";
	}

	@GetMapping("/reservationDetail/{orderId}/{memberId}")
	public String reservationDetail(@PathVariable int memberId,@PathVariable int orderId, Model model){
		List<OrderDTO> list = os.getOrder(orderId);
		String name = us.getName(memberId);
		model.addAttribute("name", name);
		model.addAttribute("list", list);
		return "/userInfo/reservationDetail";
	}
	@GetMapping("/reservationDelete/{orderId}")
	public String reservationDelete(@PathVariable int orderId) {
		int row = os.reservationDelete(orderId);
		
		return "redirect:/";
	}
	
	@PostMapping("/reservation/{memberId}")
	public String orderCancle(@RequestParam("orderId") int orderId) {
		int row = os.orderCancle(orderId);
		System.out.println(row);
		return "redirect:/";
	}
	
	
}
