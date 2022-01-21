package com.teamproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.manager.ManagerDAO;

@Service
public class ManagerService {
	
	@Autowired private ManagerDAO dao;

	public String countUser() {
		return dao.countUser();
	}

	public String countNotUser() {
		return dao.countNotUser();
	}
}
