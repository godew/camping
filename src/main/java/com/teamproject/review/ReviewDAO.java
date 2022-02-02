package com.teamproject.review;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


public interface ReviewDAO {

	@Select("select * from orders A join item_room B " + 
			"on A.itemRoomId = B.itemRoomId and a.orderid = #{orderId}")
	List<ReviewDTO> selectOrder(int orderId);

	@Insert("insert into review (memberId, starPoint, title, itemId, content, itemRoomId) values (#{memberId}, #{starPoint}, #{title}, #{itemId}, #{content}, #{itemRoomId})")
	int writeReview(@Param("orderId") int orderId,@Param("starPoint") int starPoint,@Param("memberId") int memberId,@Param("itemId") int itemId,@Param("itemRoomId") int itemRoomId,@Param("title") String title,@Param("content") String content);

}
