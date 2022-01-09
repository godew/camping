package com.teamproject.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.service.PaymentService;

@Controller
public class PaymentController {

	@Autowired private PaymentService paymentService;
	
	@GetMapping("/payment")
	public String pay() {
		return "payment/pay";
	}
	
	@GetMapping(value = "/ready", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String ready(HttpSession session) throws IOException {
		String res = paymentService.ready();
		session.setAttribute("tid", res.split("\"")[3]);
		return res;
	}
	
	@GetMapping("/approve")
	public String approve(HttpSession session, String pg_token) throws IOException {
		System.out.println(paymentService.approve(session.getAttribute("tid").toString(), pg_token));
		return "payment/pay";
	}
	
	@GetMapping("/cancel")
	@ResponseBody
	public String cancel(HttpSession session) throws IOException {
		// db의 tid가져와야 한다 지금은 test용으로 session에서 가져옴
		return paymentService.cancel(session.getAttribute("tid").toString());
	}
}
