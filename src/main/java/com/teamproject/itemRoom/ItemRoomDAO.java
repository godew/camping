package com.teamproject.itemRoom;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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

	@Select("select d${i} from calendar where itemRoomId=${itemRoomId} and month=${month}")
	int selectfindCalendar(@Param("itemRoomId") int itemRoomId, @Param("month") int month, @Param("i") int i);

	@Update("update calendar set d${i}=0 where itemRoomId=${itemRoomId} and month=${month}")
	int updateCalendar(@Param("itemRoomId") int itemRoomId, @Param("month") int month, @Param("i") int i);

	@Update("update calendar set d${i}=1 where itemRoomId=${itemRoomId} and month=${month}")
	int updateCalendar1(@Param("itemRoomId") int itemRoomId, @Param("month") int month, @Param("i") int i);
}
