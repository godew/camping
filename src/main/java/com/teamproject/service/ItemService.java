package com.teamproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.item.ItemDAO;
import com.teamproject.item.ItemDTO;

@Service
public class ItemService {

	@Autowired private ItemDAO dao;
	
	public ItemDTO findById(int itemId) {
		return dao.selectById(itemId);
	}

}
