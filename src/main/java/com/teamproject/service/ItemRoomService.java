package com.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.itemRoom.ItemRoomDAO;
import com.teamproject.itemRoom.ItemRoomDTO;
import com.teamproject.review.ReviewDTO;

@Service
public class ItemRoomService {

	@Autowired private ItemRoomDAO dao;
	
	public ItemRoomDTO findById(String itemRoomId) {
		return dao.selectById(itemRoomId);
	}
	
	public List<ItemRoomDTO> findByItemId(String itemId) {
		return dao.selectByItemId(itemId);
	}

	// image db 접근하는 메서드
	public List<String> findAllWithItemRoomId(String itemRoomId) {
		return dao.selectAllWithItemRoomId(itemRoomId);
	}
	
	public List<ReviewDTO> selectReview(String itemId){
		return dao.selectReview(itemId);
	}
}
