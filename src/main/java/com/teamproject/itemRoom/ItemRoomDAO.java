package com.teamproject.itemRoom;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ItemRoomDAO {

	@Select("select * from item_room where itemRoomId=#{itemRoomId}")
	ItemRoomDTO selectById(String itemRoomId);

	@Select("select B.* from item A join item_room B on A.itemId = ${itemID} and A.itemId = B.itemId")
	List<ItemRoomDTO> selectByItemId(String itemId);
}
