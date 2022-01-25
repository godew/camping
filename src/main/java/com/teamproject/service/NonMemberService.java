package com.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.nonMember.NonMemberDAO;
import com.teamproject.nonMember.NonMemberDTO;


@Service
public class NonMemberService {
	
	@Autowired NonMemberDAO dao;

	public List<NonMemberDTO> selectNonMember(String tid, String notPhone) {
		return dao.selectTid(tid, notPhone);
	}

}
