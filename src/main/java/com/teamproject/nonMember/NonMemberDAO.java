package com.teamproject.nonMember;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface NonMemberDAO {
	
	@Select("select * from orders A join item_room B"  
			+ "on A.itemRoomId = B.itemRoomId "
			+ "and A.tid=#{tid} and A.notphone=#{notPhone}")
	List<NonMemberDTO> selectTid(@Param("tid") String tid, @Param("notPhone") String notPhone);

}
