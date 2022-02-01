package com.teamproject.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.seemore.SeemoreDTO;
import com.teamproject.service.SeemoreService;

@Controller
@RequestMapping("/more")
public class SeemoreController {
	
	@Autowired
	private SeemoreService sc;
	
	@RequestMapping("/notice")
	public String noticePage() {
		
		return "/seemore/notice";
	}
	
	@RequestMapping("/terms")
	public String termsPage() {
		
		return "/seemore/terms";
	}
	
	@RequestMapping("/terms/{detail}")
	public String termsPage(@PathVariable String detail, Model model) {
		
		model.addAttribute("pageDetail", detail);
		
		return "/seemore/terms";
	}
	
	@RequestMapping("/over14yearsOldAgree")
	public String over14yearsOldAgreePage() {
		
		return "/seemore/over14yearsOldAgree";
	}
	
	@RequestMapping("/privacyRequire")
	public String privacyRequirePage() {
		
		return "/seemore/privacyRequire";
	}
	
	@RequestMapping("/privacySelect")
	public String privacySelectPage() {
		
		return "/seemore/privacySelect";
	}
	
	
	@RequestMapping("/insertPage")
	public String insertPage() {
		
		return "/seemore/seemoreInsert";
	}

	@PostMapping("/insert")
	public @ResponseBody HashMap<String,Object> insertNotice(@RequestBody SeemoreDTO dto) {
		
		return sc.insertNotice(dto);
	}
	
	@PostMapping("/notice/data")
	public @ResponseBody HashMap<String,Object> getNoticeData(@RequestBody HashMap<String, String> paramMap) {
		
		HashMap<String,Object> map = sc.getNoticeData(paramMap);
		
		return map;
	}
	
	@PostMapping("/terms/tabsList")
	public @ResponseBody List<SeemoreDTO> getTermTabsList(@RequestBody HashMap<String, String> paramMap) {
		
		List<SeemoreDTO> list = sc.getTermTabsList(paramMap);
		
		return list;
	}
	
	@PostMapping("/terms/dataList")
	public @ResponseBody List<SeemoreDTO> getTermDataList(@RequestBody HashMap<String, String> paramMap) {
		
		List<SeemoreDTO> list = sc.getTermDataList(paramMap);
		
		return list;
	}
	
	@PostMapping("/terms/getEnfmDateList")
	public @ResponseBody List<HashMap<String, Object>> getEnfmDateList(@RequestBody HashMap<String, String> paramMap) {
		
		List<HashMap<String, Object>> list = sc.getEnfmDateList(paramMap);
		
		return list ;
	}
}