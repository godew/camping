package com.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.filter.FilterDAO;
import com.teamproject.filter.MapDTO;




@Service
public class FilterService {
	
	@Autowired private FilterDAO fd;

	public List<MapDTO>  selectMap() {
		return fd.selectMap();
	}

	public List<MapDTO> selectOriginal() {
		return fd.selectOriginal();
	}

	public List<MapDTO> selectUnderPrice() {
		return fd.selectUnderPrice();
	}

	public List<MapDTO> selectUpPrice() {
		return fd.selectUpPrice();
	}

}
