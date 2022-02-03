package com.teamproject.member;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface MemberDAO {
	

	@Select("select * from member where memberId = #{memberID}")
	List<MemberDTO> getMember(String memberID);

	int insert(MemberDTO dto);

	@Select("select count(*) from member where email = #{email}")
	int selectID(MemberDTO dto);

	@Select("select * from member where email = #{email} and memberPW = #{memberPW}")
	MemberDTO selectMember(MemberDTO dto);

	@Update("update member set point=${point} where memberId=${memberId}")
	void upatePoint(@Param("memberId") int memberId, @Param("point") int point);
	
	@Update("update member set name=#{name} where memberId=#{memberId}")
	int updateName(@Param("name") String name, @Param("memberId") String memberId);
	
	@Update("update member set phone=#{phone} where memberId=#{memberId}")
	int updatePhone(@Param("phone") String phone,@Param("memberId") String memberId);
	@Select("select name from member where memberId=#{memberId}")
	String getName(int memberId);

	@Select("select count(*) from member where phone=#{phone}")
	int selectPhone(MemberDTO dto);

	@Select("select point from member where memberId=${memberId}")
	int selectPointByMemberId(int memberId);

	@Select("select * from member where phone=#{phone}")
	MemberDTO findID(MemberDTO dto);

	@Select("select count(*) from member where email=#{email}")
	int selectPassword(MemberDTO dto);

	@Update("update member set memberPW=#{memberPW} where email=#{email}")
	int updatePassword(MemberDTO dto);

}
