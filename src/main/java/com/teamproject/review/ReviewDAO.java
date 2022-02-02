package com.teamproject.review;

import java.util.HashMap;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;


public interface ReviewDAO {

	
	@Insert("insert into review (memberId, starPoint, title, img, itemid) vlaues(#{memberId}, #{starPoint}, #{title},#{img}, #{itemid})")
	public int writeReview(int orderId, MultipartFile img, ReviewDTO dto);

	@Insert("insert into review (memberId, starPoint, title, img, itemid) vlaues(#{memberId}, #{starPoint}, #{title},#{img}, #{itemid})")
	public int writeReview(@Param("orderId") int orderId, @Param("hMap") HashMap<String, String> hMap);
	
}
