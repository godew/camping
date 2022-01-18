package com.teamproject.review;

import org.apache.ibatis.annotations.Insert;
import org.springframework.web.multipart.MultipartFile;


public interface ReviewDAO {

	
	@Insert("insert into review (memberId, starPoint, title, img, itemId) vlaues(#{memberId}, #{starPoint}, #{title},#{img}, #{itemId})")
	public int writeReview(MultipartFile img, ReviewDTO dto);
	
}
