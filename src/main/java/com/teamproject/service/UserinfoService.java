package com.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.member.MemberDAO;
import com.teamproject.member.MemberDTO;

@Service
public class UserinfoService {

	@Autowired private MemberDAO dao;
	
	public List<MemberDTO> getMember(int memberId) {
		return dao.getMember(memberId);
	}
	
	
	

//	public String nameUpdate(String username) {
//		return dao.nameupdate(username);
//		
//	}

}
