package com.teamproject.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.member.MemberDAO;
import com.teamproject.member.MemberDTO;

@Service
public class LoginService {

	@Autowired MemberDAO dao;


	public MemberDTO login(MemberDTO dto) {
		MemberDTO login = dao.selectMember(dto);
		System.out.println("비밀번호로 찾은 계정 : " + login);
		return login;
	}


	public int checkPhone(MemberDTO dto) {
		return dao.selectPhone(dto);
	}


	public MemberDTO findId(MemberDTO dto) {
		MemberDTO find = dao.findID(dto);
		return find;
	}


	public int emailCheck(MemberDTO dto) {
		return dao.selectPassword(dto);
	}


	public int changePassword(MemberDTO dto) {
		return dao.updatePassword(dto);
	}



	
	


}
