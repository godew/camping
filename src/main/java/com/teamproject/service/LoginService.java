package com.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.member.MemberDAO;
import com.teamproject.member.MemberDTO;

@Service
public class LoginService {

	@Autowired MemberDAO dao;


	public MemberDTO login(MemberDTO dto) {
		MemberDTO login = dao.selectMember(dto);	// userid, userpw
		System.out.println("비밀번호로 찾은 계정 : " + login);
		return login;
	}

	
	


}
