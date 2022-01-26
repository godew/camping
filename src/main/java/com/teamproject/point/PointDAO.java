package com.teamproject.point;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface PointDAO {
	
	@Select("select * from point where memberId = #{memberId} order by pointDate")
	List<PointDTO> getPoint(int memberId);
	
	@Insert("insert into point values(point_seq.nextval, ${orderId}, #{title}, ${memberId}, ${tmpPoint}, sysdate, 'p')")
	void insert(@Param("tmpPoint") int tmpPoint, @Param("memberId") int memberId, @Param("title") String title, @Param("orderId") int orderId);

	@Delete("delete from point where orderId=${orderId}")
	void delete(int orderId);

	@Select("select point from point where orderId=${orderId}")
	int selectPointByOrderId(int orderId);
}
