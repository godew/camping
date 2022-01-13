package com.teamproject.item;

import org.apache.ibatis.annotations.Select;

public interface ItemDAO {

	@Select("select * from item where itemId=#{itemId}")
	ItemDTO selectById(int itemId);

}
