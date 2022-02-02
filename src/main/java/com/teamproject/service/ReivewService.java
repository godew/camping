package com.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.review.ReviewDAO;
import com.teamproject.review.ReviewDTO;

@Service
public class ReivewService {
	

	@Autowired private ReviewDAO dao;
	

//
//	public int writeReview(int orderId, ReviewDTO dto) {
//		return dao.writeReview(orderId, dto);
//	}

	public List<ReviewDTO> selectOrder(int orderId) {
		return dao.selectOrder(orderId);
	}

	public int writeReview(int orderId, int starPoint, int memberId, int itemId,
			int itemRoomId, String title, String content) {
		return dao.writeReview(orderId, starPoint, memberId, itemId, itemRoomId, title, content);
	}

	
	
}
