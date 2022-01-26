package com.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.member.MemberDAO;
import com.teamproject.member.MemberDTO;

@Service
public class UserinfoService {

	@Autowired private MemberDAO dao;
	
	public List<MemberDTO> getMember(String memberId) {
		return dao.getMember(memberId);
	}

	public void modifyPoint(int memberId, int point) {
		dao.upatePoint(memberId, point);
	}

	public int updateName(String name, String memberId) {
		return dao.updateName(name, memberId);
	}
	public int updatePhone(String phone, String memberId) {
		return dao.updatePhone(phone, memberId);
	}

	public String getName(int memberId) {
		
		return dao.getName(memberId);
	}

	public int getPointByMemberId(int memberId) {
		return dao.selectPointByMemberId(memberId);
	}

	

//	public String nameUpdate(String username) {
//		return dao.nameupdate(username);
//		
//	}

}
