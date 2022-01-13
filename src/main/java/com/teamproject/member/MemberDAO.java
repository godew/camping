package com.teamproject.member;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface MemberDAO {
	
	@Select("select * from member where memberId = #{memberId}")
	List<MemberDTO> getMember(int memberId);

//	@Update("update member set #{username}")
//	String nameupdate(String username);

	
	
}