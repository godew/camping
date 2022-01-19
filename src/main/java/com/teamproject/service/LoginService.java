package com.teamproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.member.MemberDAO;
import com.teamproject.member.MemberDTO;

@Service
public class LoginService {

	@Autowired MemberDAO dao;
	
	public MemberDTO login(MemberDTO dto) {
		return dao.login(dto);
	}

}
