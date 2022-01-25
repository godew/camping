package com.teamproject.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.teamproject.member.MemberDTO;


public class LoginIntercepter extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Handle : 컨트롤러가 요청을 처리하는 작업을 말한다
		// preHandle : 요청이 컨트롤러에 도달하기 전에 사전 작업하는 내용
		HttpSession session = request.getSession();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		System.out.print("1) ");
		System.out.println( login != null ? "로그인 사용자 : " + login.getEmail() : "로그인 없음");
		
		String requestURI = request.getRequestURI();
		String cpath = request.getContextPath();
		requestURI = requestURI.substring(cpath.length());
		System.out.println(requestURI);
		
		if(login != null) {
			return true;
		}
//		response.getWriter().println("로그인 객체가 없어서 다른 처리를 해야 합니다");
		response.sendRedirect(request.getContextPath() + "/login/login?returnURI=" + requestURI);
		return false;	// 반환값에 따라서 기존 요청에 대한 처리를 그대로 진행하거나 	true
						// 혹은 진행을 중단하고 새로운 응답을 만들어서 보낸다			false
	}
	
}
