package com.teamproject.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

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
	


	

	
}
