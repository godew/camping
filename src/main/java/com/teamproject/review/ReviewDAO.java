package com.teamproject.review;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.multipart.MultipartFile;


public interface ReviewDAO {

	@Select("select * from orders A join item_room B " + 
			"on A.itemRoomId = B.itemRoomId and a.orderid = #{orderId}")
	List<ReviewDTO> selectOrder(int orderId);
	@Insert("insert into review (memberId, starPoint, title, img, itemid) vlaues(#{memberId}, #{starPoint}, #{title},#{img}, #{itemid})")
	int writeReview(@Param("orderId") int orderId,@Param("hm") HashMap<String, String> hm);

	
//	@Insert("insert into review (memberId, starPoint, title, img, itemid) vlaues(#{memberId}, #{starPoint}, #{title},#{img}, #{itemid})")
//	public int writeReview(int orderId, MultipartFile img, ReviewDTO dto);
//
//	@Insert("insert into review (memberId, starPoint, title, img, itemid) vlaues(#{memberId}, #{starPoint}, #{title},#{img}, #{itemid})")
//	public int writeReview(@Param("orderId") int orderId, @Param("hMap") HashMap<String, String> hMap);
	
}
