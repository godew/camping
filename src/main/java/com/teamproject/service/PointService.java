package com.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.point.OrderPointDTO;
import com.teamproject.point.PointDAO;
import com.teamproject.point.ReviewPointDTO;

@Service
public class PointService {

	@Autowired PointDAO dao;

	public List<OrderPointDTO> getOPoint(int memberId) {
		return dao.getOPoint(memberId);
	}

	public List<ReviewPointDTO> getRPoint(int memberId) {
		return dao.getRPoint(memberId);
	}
	
	
}
