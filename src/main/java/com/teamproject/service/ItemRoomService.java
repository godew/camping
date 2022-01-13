package com.teamproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.itemRoom.ItemRoomDAO;
import com.teamproject.itemRoom.ItemRoomDTO;

@Service
public class ItemRoomService {

	@Autowired private ItemRoomDAO dao;
	public ItemRoomDTO findById(String itemRoomId) {
		return dao.selectById(itemRoomId);
	}

}
