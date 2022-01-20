package com.teamproject.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface MemberDAO {
	

	@Select("select * from member where memberId = #{memberId}")
	List<MemberDTO> getMember(int memberId);

	int insert(MemberDTO dto);

	@Select("select count(*) from member where email = #{email}")
	int selectID(MemberDTO dto);

	@Select("select * from member where email = #{email} and memberPW = #{memberPW}")
	MemberDTO selectMember(MemberDTO dto);

	@Update("update member set point=${point} where memberId=${memberId}")
	void upatePoint(@Param("memberId") int memberId, @Param("point") int point);


//	@Update("update member set #{username}")
//	String nameupdate(String username);
	
}
