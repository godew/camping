package com.teamproject.itemRoom;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.teamproject.review.ReviewDTO;

public interface ItemRoomDAO {

	@Select("select * from item_room where itemRoomId=#{itemRoomId}")
	ItemRoomDTO selectById(String itemRoomId);

	@Select("select B.* from item A join item_room B on A.itemId = ${itemID} and A.itemId = B.itemId")
	List<ItemRoomDTO> selectByItemId(String itemId);

	@Select("select image from image where itemRoomId=${itemRoomId}")
	List<String> selectAllWithItemRoomId(String itemRoomId);
	
	@Select("select * from review where itemId=#{itemRoomId}")
	List<ReviewDTO> selectReview(String itemId);
}
