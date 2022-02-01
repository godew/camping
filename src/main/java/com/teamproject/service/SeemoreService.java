package com.teamproject.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.seemore.SeemoreDAO;
import com.teamproject.seemore.SeemoreDTO;

@Service
public class SeemoreService {
	
	@Autowired
	private SeemoreDAO dao;

	public HashMap<String, Object> insertNotice(SeemoreDTO dto) {
		HashMap<String, Object> result = new HashMap<>();
		
		int resultCode =  dao.insertNotice(dto);
		
		if(resultCode > 0) {
			result.put("resultCode", resultCode);
			result.put("resultMsg", "데이터 추가 성공");
		} else {
			result.put("resultCode", resultCode);
			result.put("resultMsg", "데이터 추가 실패");
		}
		
		return result;
	}

	public HashMap<String,Object> getNoticeData(HashMap<String, String> paramMap) {
		
		List<SeemoreDTO> list = dao.getNoticeData(paramMap);
		int totalCount = dao.getTotalNoticeDataCnt(paramMap);
		
		HashMap<String,Object> result = new HashMap<>();
		result.put("list", list);
		result.put("pTotalCount", totalCount);
		
		return result;
	}

	public List<SeemoreDTO> getTermTabsList(HashMap<String, String> paramMap) {
		List<SeemoreDTO> list = dao.getTermTabsList(paramMap);
		
		return list;
	}

	public List<SeemoreDTO> getTermDataList(HashMap<String, String> paramMap) {
		List<SeemoreDTO> list = dao.getTermDataList(paramMap);
		
		return list;
	}

	public List<HashMap<String, Object>> getEnfmDateList(HashMap<String, String> paramMap) {
		List<HashMap<String, Object>> list = dao.getEnfmDateList(paramMap);
		
		return list;
	}

}