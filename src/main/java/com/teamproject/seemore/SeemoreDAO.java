package com.teamproject.seemore;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SeemoreDAO {
	
	public int insertNotice(SeemoreDTO dto);

	public List<SeemoreDTO> getNoticeData(HashMap<String, String> paramMap);

	public int getTotalNoticeDataCnt(HashMap<String, String> paramMap);

	public List<SeemoreDTO> getTermTabsList(HashMap<String, String> paramMap);

	public List<SeemoreDTO> getTermDataList(HashMap<String, String> paramMap);

	public List<HashMap<String, Object>> getEnfmDateList(HashMap<String, String> paramMap);

} 