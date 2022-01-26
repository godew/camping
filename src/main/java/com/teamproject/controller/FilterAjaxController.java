package com.teamproject.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.teamproject.filter.FilterDTO;
import com.teamproject.filter.MapDTO;
import com.teamproject.service.FilterService;


@RestController
public class FilterAjaxController {
	
@Autowired private FilterService fs;
	
	@GetMapping("/map")
	public List<MapDTO> map(){
		List<MapDTO> list = fs.selectMap();
		return list;
	}
	
	@GetMapping("/select")
	public List<MapDTO> selectOriginal(){
		List<MapDTO> list = fs.select();
		return list;
	}
	
	@GetMapping("/selectOriginal/{areacode}")
	public List<MapDTO> selectOriginal(@PathVariable String areacode){
		List<MapDTO> list = fs.selectOriginal(areacode);
		return list;
	}
	
	@GetMapping("/underPrice/{areacode}")
	public List<MapDTO> underPrice(@PathVariable String areacode){
		List<MapDTO> list = fs.selectUnderPrice(areacode);
		return list;
	}
	
	@GetMapping("/place/{areacode}")
	public List<MapDTO> place(@PathVariable String areacode){
		List<MapDTO> list = fs.selectPlace(areacode);
		return list;
	}
	
	@GetMapping("/upPrice/{areacode}")
	public List<MapDTO> upPrice(@PathVariable String areacode){
		List<MapDTO> list = fs.selectUpPrice(areacode);
		return list;
	}
	
	@GetMapping("/searchArea/{areaCode}")
	public List<MapDTO> selectArea(@PathVariable String areaCode){
		List<MapDTO> list = fs.selectArea(areaCode);
		return list;
	}
	
	@SuppressWarnings("unused")
	@GetMapping("/submitSearch")
	public ArrayList<FilterDTO> submitSearch(@RequestParam HashMap<String, String> map){
		
		ArrayList<FilterDTO> list = new ArrayList<FilterDTO>();
		int itemId = 0;
		
		String areacode = map.get("areacode");
		String firstMonth = map.get("checkInDay").substring(0, 2);
		String secondMonth = map.get("checkOutDay").substring(0, 2);
		String firstDay = map.get("checkInDay").substring(2, 4);
		String secondDay = map.get("checkInDay").substring(2, 4);
		String people = map.get("people");
		String minPrice = map.get("minPrice");
		String maxPrice = map.get("maxPrice");
		String checkLabel = map.get("checkLabel");
		String fd = "D"+firstDay;
//		
//		System.out.println(firstMonth);
//		System.out.println(secondMonth);
//		System.out.println(firstDay);
//		System.out.println(secondDay);
		
		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("areacode", areacode);
		hmap.put("fd", fd);
		hmap.put("secondDay", secondDay);
		hmap.put("firstDay", firstDay);
		hmap.put("people", people);
		hmap.put("minPrice", minPrice);
		hmap.put("maxPrice", maxPrice);
		hmap.put("checkLabel", checkLabel);
		hmap.put("firstMonth", firstMonth);
		hmap.put("secondMonth", secondMonth);
		hmap.put("checkLabel", checkLabel);
		
		System.out.println(hmap);
		
//		if(firstMonth == secondMonth) {
//			for(int i = 1; i <= 188; i++) {
//				itemId = i;
//				list.addAll(fs.submitSearch(itemId));
//			}
//		}
		list.addAll(fs.submitFilter(hmap));
			
		System.out.println(list);
		
		return list;
	}

	

	
}
