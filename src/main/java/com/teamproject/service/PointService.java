package com.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.point.PointDAO;
import com.teamproject.point.PointDTO;

@Service
public class PointService {

	@Autowired PointDAO dao;

	public List<PointDTO> getPoint(int memberId) {
		return dao.getPoint(memberId);
	}

	public void addP(int point, int memberId, String title, int orderId) {
		dao.insertP(point, memberId, title, orderId);
	}
	
	public void addR(int point, int memberId, String title, int orderId) {
		dao.insertR(point, memberId, title, orderId);
	}

	public void delete(int orderId) {
		dao.delete(orderId);
	}

	public int getPointByOrderId(int orderId) {
		return dao.selectPointByOrderId(orderId);
	}

	public int takePoint(int orderId, int point, int memberId, String title) {
		System.out.println(orderId);
		int row = 0;
		return row = dao.takePoint(orderId);
	}

}
