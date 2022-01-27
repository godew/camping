package com.teamproject.review;

import org.apache.ibatis.annotations.Insert;
import org.springframework.web.multipart.MultipartFile;


public interface ReviewDAO {

	
	@Insert("insert into review (memberId, starPoint, title, img, itemid) vlaues(#{memberId}, #{starPoint}, #{title},#{img}, #{itemid})")
	public int writeReview(int orderId, MultipartFile img, ReviewDTO dto);
	
}
