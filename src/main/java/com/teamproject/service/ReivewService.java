package com.teamproject.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.teamproject.review.ReviewDAO;
import com.teamproject.review.ReviewDTO;

@Service
public class ReivewService {
	

	@Autowired private ReviewDAO dao;
	
	private String uploadPath = "C:\\upload";
	private File dir;
	
	public ReivewService() {
		dir = new File(uploadPath);
		if(dir.exists() == false) {
			System.out.println("폴더가 없어서 새로 생성함");
			dir.mkdirs();
		}
	}

	public int writeReview(int orderId, MultipartFile img, ReviewDTO dto) {
		int row = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		String fileName = img.getOriginalFilename();
		
		fileName = dto.getItemId() + "_" + dto.getMemberId();
		
		File dest = new File(dir, fileName);
		
		System.out.println(fileName);
		System.out.println(img.getSize());
		System.out.println(dto.getStarPoint());
		System.out.println(dto.getTitle());
//		int row = dao.writeReview(orderId, img, dto);
		return row;
	}

	public int writeReview(int orderId, HashMap<String, String> hm) {
//		int row = 0;
		int row = dao.writeReview(orderId, hm);
		return row;
	}

	public List<ReviewDTO> selectOrder(int orderId) {
		return dao.selectOrder(orderId);
	}

	
	
}
