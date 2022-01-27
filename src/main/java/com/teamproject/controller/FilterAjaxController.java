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
import com.teamproject.item.ItemDTO;
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
	
//	@SuppressWarnings("unused")
	@GetMapping("/submitSearch")
	public ArrayList<FilterDTO> submitSearch(@RequestParam HashMap<String, String> map){
		
		ArrayList<FilterDTO> result = new ArrayList<FilterDTO>();
		int itemId = 0;
		
		String areacode = map.get("areacode");
		String firstMonth = "";
		String secondMonth = "";
		String firstDay = map.get("checkInDay");
		String secondDay = map.get("checkInDay");
		String people = map.get("people");
		String minPrice = map.get("minPrice");
		String maxPrice = map.get("maxPrice");
		String checkLabel = map.get("checkLabel");
		String fd = "D"+firstDay;
		String sd = "D"+secondDay;
		
		if(firstDay.length() == 3 && secondDay.length() == 3) {
			firstMonth = firstDay.substring(0,1);
			secondMonth = secondDay.substring(0,1);
		}
		else if(firstDay.length() == 4 && secondDay.length() == 4 ) {
			firstMonth = firstDay.substring(0,2);
			secondMonth = secondDay.substring(0,2);
		}
		else if(firstDay.length() == 3 && secondDay.length() == 4 ) {
			firstMonth = firstDay.substring(0,2);
			secondMonth = secondDay.substring(0,1);
		}
		else if(firstDay.length() == 4 && secondDay.length() == 3 ) {
			firstMonth = firstDay.substring(0,1);
			secondMonth = secondDay.substring(0,2);
		}
		

		HashMap<String, String> hmap = new HashMap<String, String>();
		hmap.put("areacode", areacode);
		hmap.put("fd", fd);
		hmap.put("sd", sd);
		hmap.put("secondDay", secondDay);
		hmap.put("firstDay", firstDay);
		hmap.put("people", people);
		hmap.put("minPrice", minPrice);
		hmap.put("maxPrice", maxPrice);
		hmap.put("checkLabel", checkLabel);
		hmap.put("firstMonth", firstMonth);
		hmap.put("secondMonth", secondMonth);
		hmap.put("checkLabel", checkLabel);
		
//		System.out.println(map.get("areacode"));
//			query(price, areacode)
//			List<ItemDTO> list = select * from item where price<=price and areacode
//			for(int i = 1; i <= 188; i++) {
//				
//				itemId = i;
		
		
		
		if(Integer.parseInt(firstMonth) == Integer.parseInt(secondMonth)) {
			
			List<FilterDTO> list = fs.selectFirstList(map);
			
			
			for(int i = 0; i < list.size(); i++) {
				itemId = list.get(i).getItemid();
				
				ArrayList<FilterDTO> tmp = fs.submitSearch(itemId);
				
				for(int j = 0; j < tmp.size(); j++) {
					FilterDTO filter = tmp.get(j);
					
					if (Integer.parseInt(map.get("people")) <= Integer.parseInt(filter.getMaxpeople())) {
						
						result.add(tmp.get(j));
						break;
					}
//				for (int j = 0; j < tmp.size(); j++) {
					HashMap<Integer, String> calMap = getCalMap(tmp.get(j));
//					for() {
//						if(calMap.get(k) == 0) {
//							false
//						}
//					}
//					}
				}
			}			
		} // if end 

		

//		System.out.println(map);
		
//		filterDTO -> 
//		itemDTO -> 개
//		System.out.println(result.toString());
		
		
		
		return result;
	
	
}

	public HashMap<Integer, String> getCalMap(FilterDTO dto) {
		HashMap<Integer, String> calMap = new HashMap<>();
		calMap.put(1, dto.getD1());
		calMap.put(2, dto.getD2());
		calMap.put(3, dto.getD3());
		calMap.put(4, dto.getD3());
		calMap.put(5, dto.getD3());
		calMap.put(6, dto.getD3());
		calMap.put(7, dto.getD3());
		calMap.put(8, dto.getD3());
		calMap.put(9, dto.getD3());
		calMap.put(10, dto.getD3());
		calMap.put(11, dto.getD1());
		calMap.put(12, dto.getD2());
		calMap.put(13, dto.getD3());
		calMap.put(14, dto.getD3());
		calMap.put(15, dto.getD3());
		calMap.put(16, dto.getD3());
		calMap.put(17, dto.getD3());
		calMap.put(18, dto.getD3());
		calMap.put(19, dto.getD3());
		calMap.put(20, dto.getD3());
		calMap.put(21, dto.getD1());
		calMap.put(22, dto.getD2());
		calMap.put(23, dto.getD3());
		calMap.put(24, dto.getD3());
		calMap.put(25, dto.getD3());
		calMap.put(26, dto.getD3());
		calMap.put(27, dto.getD3());
		calMap.put(28, dto.getD3());
		calMap.put(29, dto.getD3());
		calMap.put(30, dto.getD3());
		calMap.put(31, dto.getD3());
		return calMap;
	}
}
