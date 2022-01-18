package com.teamproject.member;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface MemberDAO {
	
	@Select("select * from member where memberId = #{memberId}")
	List<MemberDTO> getMember(int memberId);

	int insert(MemberDTO dto);

	@Select("select * from member where memberId = #{memberId")
	String selectID(MemberDTO dto);

//	@Update("update member set #{username}")
//	String nameupdate(String username);

	
	
}
