package com.teamproject.controller;


import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.velocity.runtime.directive.Parse;
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
	
	@GetMapping("/submitSearch")
	public ArrayList<FilterDTO> submitSearch(@RequestParam HashMap<String, String> map){
		ArrayList<FilterDTO> result = new ArrayList<FilterDTO>();
		String itemId = "";
		
		String firstMonth = "";
		String secondMonth = "";
		String firstDay = map.get("checkInDay");
		String secondDay = map.get("checkOutDay");
		
		if(firstDay.length() == 3 && secondDay.length() == 3) {
			firstMonth = firstDay.substring(0,1);
			secondMonth = secondDay.substring(0,1);
			firstDay = firstDay.substring(1,3);
			secondDay = secondDay.substring(1, 3);
		}
		else if(firstDay.length() == 4 && secondDay.length() == 4 ) {
			firstMonth = firstDay.substring(0,2);
			secondMonth = secondDay.substring(0,2);
			firstDay = firstDay.substring(2, 3);
			secondDay = secondDay.substring(2, 3);
		}
		else if(firstDay.length() == 3 && secondDay.length() == 4 ) {
			firstMonth = firstDay.substring(0,2);
			secondMonth = secondDay.substring(0,1);
			firstDay = firstDay.substring(1,3);
			secondDay = secondDay.substring(2, 3);
		}
		else if(firstDay.length() == 4 && secondDay.length() == 3 ) {
			firstMonth = firstDay.substring(0,1);
			secondMonth = secondDay.substring(0,2);
			firstDay = firstDay.substring(2, 3);
			secondDay = secondDay.substring(1, 3);
		}
		


		
		
		if(Integer.parseInt(firstMonth) == Integer.parseInt(secondMonth)) {
			map.put("firstMonth", firstMonth);
			System.out.println(map);
			List<FilterDTO> list = fs.selectFirstList(map); // areacode, price 1차 
			ArrayList<FilterDTO> list2 = new ArrayList<FilterDTO>();
					
			
			String test1 = map.get("checkLabel");
			String[] strArr = test1.split(":");
			
			for(String s : strArr) {
				System.out.println(s);
				for(int i = 0; i < list.size(); i++) {
					String filterTest = list.get(i).getFilter();
					if(filterTest.contains(s)) {
						System.out.println("itemid :" + list.get(i).getItemid());
						list2.add(list.get(i));
					}
					
				}
			}
			
			
			
//			for(int i = 0; i < list.size(); i++) {
//				String filterTest = list.get(i).getFilter();
//				for(String s : strArr) {
//					if(filterTest.contains(s)) {
//						list2.add(list.get(i));
//					}
//				}
//			}
			
			System.out.println(list2);
			System.out.println(list2.size());
			

			
			
			for(int i = 0; i < list2.size(); i++) {
				itemId = list2.get(i).getItemid(); // areacode와 price로 걸러진 list 숫자만큼 itemid로
				
				ArrayList<FilterDTO> tmp = fs.submitSearch(itemId); // 한 번 더 검색 (list들을 tmp에 저장)
				
				for(int j = 0; j < tmp.size(); j++) { // 검색 된 tmp의 size만큼 반복문을 돌리는데 그 중
//					FilterDTO filter = tmp.get(j);
					if (Integer.parseInt(map.get("people")) <= Integer.parseInt(tmp.get(j).getMaxpeople())) {
						// 가격이 조건에 맞고
						result.add(tmp.get(j));
						break;
					}
					for (int k = 0; k < tmp.size(); k++) {
						HashMap<Integer, String> calMap = getCalMap(tmp.get(k));
						for(int l = Integer.parseInt(firstDay); l <= Integer.parseInt(secondDay); l++) {
							// 날짜가 1인 것들만 값을 불러 옴 
							if(calMap.get(l) == "1") {
								result.add(tmp.get(j));;
							}
							else if(calMap.get(l) == "0") {
								break;
							}
						}
						itemId = result.get(k).getItemid();
						// 결과가 다 된 것들의 itemid만 뽑아와서 
					}
				}
				ArrayList<FilterDTO> tmprs = fs.search1(itemId);
				// 다시 list로 띄울 것들을 itemid로 검색해서 tmprs에 저장
				
				for(int z = 0; z < tmprs.size(); z++) {
					result.add(tmprs.get(z)); // 그것들을 다시 result에 저장
				}
			}
			return result; // result를 반환
		} // if end 
		else if(Integer.parseInt(firstMonth) != Integer.parseInt(secondMonth)) {
			map.put("firstMonth", firstMonth);
			map.put("secondMonth", secondMonth);
			
			
			List<FilterDTO> list = fs.selectFirstList2(map); // areacode, price 1차 
			ArrayList<FilterDTO> list2 = new ArrayList<FilterDTO>();
			
			String test1 = map.get("checkLabel");
			String[] strArr = test1.split(":");
			for(String s : strArr) {
				System.out.println(s);
				for(int i = 0; i < list.size(); i++) {
					String filterTest = list.get(i).getFilter();
					
					if(filterTest.contains(s)) {
						if(list.get(i).getItemid() == list.get(i).getItemid()) {
							System.out.println("list 동일 : " + list.get(i).getItemid());
						}
						list2.add(list.get(i));
					}
					
				}
			}
			
			System.out.println("list2.size : " + list2.size());
			
			
			
			for(int i = 0; i < list2.size(); i++) {
				itemId = list2.get(i).getItemid();
				
				ArrayList<FilterDTO> tmp = fs.submitSearch(itemId);
				
				for(int j = 0; j < tmp.size(); j++) {
					if (Integer.parseInt(map.get("people")) <= Integer.parseInt(tmp.get(j).getMaxpeople())) {
						result.add(tmp.get(j));
						break;
					}
					for (int k = 0; k < tmp.size(); k++) {
						HashMap<Integer, String> calMap = getCalMap(tmp.get(k));
						for(int l = Integer.parseInt(firstDay); l <= 31; l++) {
							if(calMap.get(l) == "1") {
								result.add(tmp.get(j));
							}
							
							else if(calMap.get(l) == "0") {
								break;
							}
						}
						
						for(int o = 1; o <= Integer.parseInt(secondDay); o++) {
							if(calMap.get(o) == "1") {
								result.add(tmp.get(j));
							}
							else if(calMap.get(o) == "0") {
								break;
							}
						}
						
						itemId = result.get(k).getItemid();
					}
				}
				ArrayList<FilterDTO> tmprs = fs.search1(itemId);
				
				for(int z = 0; z < tmprs.size(); z++) {
					result.add(tmprs.get(z));
				}
			}
		}
		
		return result;
}	// submitSearch() end
	


	@GetMapping("/mainAllFilter")
	public List<FilterDTO> mainAllFilter(@RequestParam HashMap<String, String> map){
		ArrayList<FilterDTO> result = new ArrayList<FilterDTO>();
		String itemId = "";
		
		String firstMonth = "";
		String secondMonth = "";
		String firstDay = map.get("checkInDay");
		String secondDay = map.get("checkOutDay");
		
		
		if(firstDay.length() == 3 && secondDay.length() == 3) {
			firstMonth = firstDay.substring(0,1);
			secondMonth = secondDay.substring(0,1);
			firstDay = firstDay.substring(1,3);
			secondDay = secondDay.substring(1, 3);
		}
		else if(firstDay.length() == 4 && secondDay.length() == 4 ) {
			firstMonth = firstDay.substring(0,2);
			secondMonth = secondDay.substring(0,2);
			firstDay = firstDay.substring(2, 3);
			secondDay = secondDay.substring(2, 3);
		}
		else if(firstDay.length() == 3 && secondDay.length() == 4 ) {
			firstMonth = firstDay.substring(0,2);
			secondMonth = secondDay.substring(0,1);
			firstDay = firstDay.substring(1,3);
			secondDay = secondDay.substring(2, 3);
		}
		else if(firstDay.length() == 4 && secondDay.length() == 3 ) {
			firstMonth = firstDay.substring(0,1);
			secondMonth = secondDay.substring(0,2);
			firstDay = firstDay.substring(2, 3);
			secondDay = secondDay.substring(1, 3);
		}
		
		if(Integer.parseInt(firstDay) < 10 && Integer.parseInt(secondDay) < 10) {
			firstDay = firstDay.substring(1,2);
			secondDay = secondDay.substring(1,2);
		}
		
		if(Integer.parseInt(firstMonth) == Integer.parseInt(secondMonth)) {
			map.put("firstMonth", firstMonth);
			List<FilterDTO> list = fs.mainSelectArea(map);
			for(int i = 0; i < list.size(); i++) {
				itemId = list.get(i).getItemid();
				map.put("itemId", itemId);
				ArrayList<FilterDTO> tmp = fs.submitSearch3(map);
				for(int j = 0; j < tmp.size(); j++) {
					HashMap<Integer, String> calMap = getCalMap(tmp.get(j));
					for(int l = Integer.parseInt(firstDay); l <= 31; l++) {
						if(calMap.get(l) == "1") {
							result.add(tmp.get(j));
							itemId = result.get(l).getItemid();
						}
						
						else if(calMap.get(l) == "0") {
							break;
						}
					}
					
					for(int o = 1; o <= Integer.parseInt(secondDay); o++) {
						if(calMap.get(o) == "1") {
							result.add(tmp.get(j));
							itemId = result.get(o).getItemid();
						}
						else if(calMap.get(o) == "0") {
							break;
						}
					}
					
				}
				ArrayList<FilterDTO> tmprs = fs.search2(itemId);
				
				for(int z = 0; z < tmprs.size(); z++) {
					result.add(tmprs.get(z));
				}
			}			
			return result;
		}
		else if(Integer.parseInt(firstMonth) != Integer.parseInt(secondMonth)) {
			System.out.println(firstMonth);
			System.out.println(secondMonth);
			System.out.println(map);
			map.put("firstMonth", firstMonth);
			map.put("secondMonth", secondMonth);
			
			List<FilterDTO> list = fs.mainSelectArea(map);
			for(int i = 0; i < list.size(); i++) {
				itemId = list.get(i).getItemid();
				map.put("itemId", itemId);
				ArrayList<FilterDTO> tmp = fs.mainSelectArea2(map);
				for(int j = 0; j < tmp.size(); j++) {
					HashMap<Integer, String> calMap = getCalMap(tmp.get(j));
					for(int l = Integer.parseInt(firstDay); l <= 31; l++) {
						if(calMap.get(l) == "1") {
							result.add(tmp.get(j));
							itemId = result.get(l).getItemid();
						}
						
						else if(calMap.get(l) == "0") {
							break;
						}
					}
					
					for(int o = 1; o <= Integer.parseInt(secondDay); o++) {
						if(calMap.get(o) == "1") {
							result.add(tmp.get(j));
							itemId = result.get(o).getItemid();
						}
						else if(calMap.get(o) == "0") {
							break;
						}
					}
					
				}
				ArrayList<FilterDTO> tmprs = fs.search2(itemId);
				
				for(int z = 0; z < tmprs.size(); z++) {
					result.add(tmprs.get(z));
				}
			}			
			return result;
			
		}
		return result;
} // function end


	public HashMap<Integer, String> getCalMap(FilterDTO dto) {
		HashMap<Integer, String> calMap = new HashMap<>();
		calMap.put(1, dto.getD1());
		calMap.put(2, dto.getD2());
		calMap.put(3, dto.getD3());
		calMap.put(4, dto.getD4());
		calMap.put(5, dto.getD5());
		calMap.put(6, dto.getD6());
		calMap.put(7, dto.getD7());
		calMap.put(8, dto.getD8());
		calMap.put(9, dto.getD9());
		calMap.put(10, dto.getD10());
		calMap.put(11, dto.getD11());
		calMap.put(12, dto.getD12());
		calMap.put(13, dto.getD13());
		calMap.put(14, dto.getD14());
		calMap.put(15, dto.getD15());
		calMap.put(16, dto.getD16());
		calMap.put(17, dto.getD17());
		calMap.put(18, dto.getD18());
		calMap.put(19, dto.getD19());
		calMap.put(20, dto.getD20());
		calMap.put(21, dto.getD21());
		calMap.put(22, dto.getD22());
		calMap.put(23, dto.getD23());
		calMap.put(24, dto.getD24());
		calMap.put(25, dto.getD25());
		calMap.put(26, dto.getD26());
		calMap.put(27, dto.getD27());
		calMap.put(28, dto.getD28());
		calMap.put(29, dto.getD29());
		calMap.put(30, dto.getD30());
		calMap.put(31, dto.getD31());
		return calMap;
	}
}
