package com.teamproject.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.member.MemberDTO;
import com.teamproject.order.OrderDTO;
import com.teamproject.point.PointDTO;
import com.teamproject.reservation.reservationDTO;
import com.teamproject.service.ItemRoomService;
import com.teamproject.service.OrderService;
import com.teamproject.service.PaymentService;
import com.teamproject.service.PointService;
import com.teamproject.service.ReservationeService;
import com.teamproject.service.UserinfoService;

@Controller
public class UserInfoController {
	
	@Autowired private PaymentService paymentService;
	@Autowired private UserinfoService us;
	@Autowired private PointService ps;
	@Autowired private ReservationeService rs;
	@Autowired private OrderService os;
	@Autowired private ItemRoomService itemRoomService;
	
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
		
		return "redirect:/reservationDelete/" + orderId;
	}
	
	@PostMapping("/reservation/{memberId}")
	public String orderCancle(@RequestParam("orderId") int orderId, @PathVariable int memberId) throws IOException {
		os.orderCancle(orderId);
		
		OrderDTO order = os.getOrder(orderId).get(0);
		int month1 = Integer.valueOf(order.getCheckIn().substring(0, 2));
		int month2 = Integer.valueOf(order.getCheckOut().substring(0, 2));
		int d1 = Integer.valueOf(order.getCheckIn().substring(2, 4));
		int d2 = Integer.valueOf(order.getCheckOut().substring(2, 4));
		if (month1 == month2) {
			for (int i = d1; i < d2+1; i++) {
				itemRoomService.modifyCalendar1(order.getItemRoomId(), month1, i);
			}
		} else {
			for (int i = d1; i < 32; i++) {
				itemRoomService.modifyCalendar1(order.getItemRoomId(), month1, i);
			}
			
			for (int i = month1+1; i <= month2-1; i++) {
				for (int j = 1; j < 32; j++) {
					itemRoomService.modifyCalendar1(order.getItemRoomId(), i, j);
				}
			}
			
			for (int i = 1; i < d2 + 1; i++) {
				itemRoomService.modifyCalendar1(order.getItemRoomId(), month2, i);
			}
		}
		
		// kakao pay cancel function
		paymentService.cancel(os.getOrder(orderId).get(0).getTid());
		
		return "redirect:/reservation/" + memberId;
	}
	
	@GetMapping("/getPoint/{orderId}")
	public String getPoint(@PathVariable int orderId, HttpSession session) {
		int row = ps.takePoint(orderId); 
		int memberId = ((MemberDTO)session.getAttribute("login")).getMemberID();
		System.out.println(memberId);
		return "redirect:/reservation/" + memberId;
	}
}
