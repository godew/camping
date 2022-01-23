package com.teamproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@GetMapping("/selectArea/{areaCode}")
	public List<MapDTO> selectArea(@PathVariable String areaCode){
		List<MapDTO> list = fs.selectArea(areaCode);
		return list;
	}
	
	@GetMapping(value="/product/search", produces="application/json; charset=utf-8")
	@ResponseBody
	public HashMap<String, String> selectDay(@RequestParam HashMap<String, String> map){
		System.out.println(map);
		return map;
	}
}
