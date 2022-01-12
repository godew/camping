package com.teamproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("/selectOriginal")
	public List<MapDTO> selectOriginal(){
		List<MapDTO> list = fs.selectOriginal();
		return list;
	}
	
	@GetMapping("/underPrice")
	public List<MapDTO> underPrice(){
		List<MapDTO> list = fs.selectUnderPrice();
		return list;
	}
	
	@GetMapping("/upPrice")
	public List<MapDTO> upPrice(){
		List<MapDTO> list = fs.selectUpPrice();
		return list;
	}
}
