package com.teamproject.point;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface PointDAO {
	
	@Select("select * from point where memberId = #{memberId} order by pointDate")
	List<PointDTO> getPoint(int memberId);
	

}
