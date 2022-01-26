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

	public void add(int tmpPoint, int memberId, String title, int orderId) {
		dao.insert(tmpPoint, memberId, title, orderId);
	}
}
