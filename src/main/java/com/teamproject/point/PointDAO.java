package com.teamproject.point;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface PointDAO {
	
	@Select("select * from order_point where memberId = #{memberId}")
	List<OrderPointDTO> getOPoint(int memberId);
	
	@Select("select * from review_point where memberId = #{memberId}")
	List<ReviewPointDTO> getRPoint(int memberId);

}
