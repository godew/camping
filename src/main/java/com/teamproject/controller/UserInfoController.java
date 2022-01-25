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
import com.teamproject.point.OrderPointDTO;
import com.teamproject.point.ReviewPointDTO;
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
	@ResponseBody
	public String userNameUpdate(@RequestParam("name") String name,@PathVariable String memberId) {
		System.out.println(name);
		int row = 0;
		if(name != null) {
		row = us.updateName(name, memberId);
		}
		else {
//		row = us.updatePhone(phone, memberId);
		}
		System.out.println(row);
		return "/userInfo/userinfo" + memberId;
	}
//	@PostMapping("/userInfo/{memberId}")
//	public int phoneUpdate(@PathVariable String phone, @PathVariable String memberId) {
//		int row = us.updatePhone(phone, memberId);
//		return row;
//	}
	

	@GetMapping("/point/{memberID}")
	public String point(@PathVariable int memberID, Model model, HttpSession session) {
		Object dto = session.getAttribute("login");
		System.out.println("dto :" + dto);
		System.out.println("session :" + session);
		model.addAttribute("dto", dto);
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
	
	@GetMapping("/reservation/{memberId}")
	public String reservation(@PathVariable int memberId, Model model, HttpSession session) {
		List<reservationDTO> list = rs.getReservation(memberId);
		Object dto = session.getAttribute("login");
		String name = us.getName(memberId);
		model.addAttribute("name", name);
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		
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
	
}
