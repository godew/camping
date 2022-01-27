package com.teamproject.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.filter.FilterDAO;
import com.teamproject.filter.FilterDTO;
import com.teamproject.filter.MapDTO;




@Service
public class FilterService {
	
	@Autowired private FilterDAO fd;

	public List<MapDTO>  selectMap() {
		return fd.selectMap();
	}

	public List<MapDTO> selectOriginal(String areacode) {
		return fd.selectOriginal(areacode);
	}

	public List<MapDTO> selectUnderPrice(String areacode) {
		return fd.selectUnderPrice(areacode);
	}
	
	public List<MapDTO> selectUpPrice(String areacode) {
		return fd.selectUpPrice(areacode);
	}

	public List<MapDTO> selectArea(String areaCode) {
		return fd.selectArea(areaCode);
	}

	public List<MapDTO> selectPlace(String areacode) {
		return fd.selectPlace(areacode);
	}

	public List<MapDTO> select() {
		return fd.select();
	}

	public ArrayList<FilterDTO> submitSearch(int itemId) {
		return fd.submitSearch(itemId);
	}

//	public HashMap<String, String> searchDate(ArrayList<FilterDTO> tmp) {
//		// TODO Auto-generated method stub
//		return fd.searchDate(tmp);
//	}
	
	
	public List<FilterDTO> selectFirstList(HashMap<String, String> map) {
		return fd.selectFirstList(map);
	}









}
