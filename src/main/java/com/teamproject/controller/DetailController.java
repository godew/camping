package com.teamproject.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.item.ItemDTO;
import com.teamproject.itemRoom.ItemRoomDTO;
import com.teamproject.review.ReviewDTO;
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
		// calendar
		List<String> calendar = new ArrayList<>();
		int month = Integer.valueOf(checkIn.substring(0, 2));
		int d1 = Integer.valueOf(checkIn.substring(2, 4));
		int d2 = Integer.valueOf(checkOut.substring(2, 4));
		for (ItemRoomDTO room : rooms) {
			for (int i = d1; i < d2+1; i++) {
				if (itemRoomService.findCalendar(room.getItemRoomId(), month, i) == 0) {
					calendar.add("0");
					break;
				} else if (i == d2){
					calendar.add("1");
				}
			}
		}
		model.addAttribute("calendar", calendar);

		// review
		List<ReviewDTO> review = itemRoomService.selectReview(itemId);
		model.addAttribute("review", review);
		
		return "detail/detail";
	}
	
	@GetMapping("/product/detail/images")
	@ResponseBody
	public List<String> images(String itemRoomId) {
		List<String> images = itemRoomService.findAllWithItemRoomId(itemRoomId);
		return images;
	}
	
	@GetMapping("/product/detail/people")
	@ResponseBody
	public ItemRoomDTO people(String itemRoomId) {
		ItemRoomDTO people = itemRoomService.findById(itemRoomId);
		return people;
	}
}
