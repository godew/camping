package com.teamproject.itemRoom;

import org.apache.ibatis.annotations.Select;

public interface ItemRoomDAO {

	@Select("select * from item_room where itemRoomId=#{itemRoomId}")
	ItemRoomDTO selectById(String itemRoomId);

}
