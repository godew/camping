package com.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.member.MemberDAO;
import com.teamproject.member.MemberDTO;

@Service
public class UserinfoService {

	@Autowired private MemberDAO dao;
	
	public List<MemberDTO> getMember() {
		return dao.getMember();
	}

}
