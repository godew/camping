package com.teamproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.item.ItemDTO;
import com.teamproject.itemRoom.ItemRoomDTO;
import com.teamproject.service.ItemRoomService;
import com.teamproject.service.ItemService;

@Controller
public class DetailController {
	
	@Autowired private ItemService itemService;
	@Autowired private ItemRoomService itemRoomService;
	
	@GetMapping("/product/detail")
	public String detail(Model model, String itemId, String checkIn, String checkOut) {
		ItemDTO item = itemService.findById(Integer.parseInt(itemId));
		List<ItemRoomDTO> rooms = itemRoomService.findByItemId(itemId);
		model.addAttribute("rooms", rooms);
		model.addAttribute("item", item);
		
		return "detail/detail";
	}
	
	@GetMapping("/product/detail/images")
	@ResponseBody
	public List<String> images(String itemRoomId) {
		List<String> images = itemRoomService.findAllWithItemRoomId(itemRoomId);
		return images;
	}
}
