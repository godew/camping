package com.teamproject.point;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface PointDAO {
	
	// memberPoint
	@Select("select * from point where memberId = #{memberId} order by pointDate")
	List<PointDTO> getPoint(int memberId);

	// 결제 적립 포인트
	@Insert("insert into point values(point_seq.nextval, ${orderId}, #{title}, ${memberId}, ${point}, sysdate, 'p')")
	void insertP(@Param("point") int point, @Param("memberId") int memberId, @Param("title") String title, @Param("orderId") int orderId);

	// 마이너스 포인트
	@Insert("insert into point values(point_seq.nextval, ${orderId}, #{title}, ${memberId}, ${point}, sysdate, 'r')")
	void insertR(@Param("point") int point, @Param("memberId") int memberId, @Param("title") String title, @Param("orderId") int orderId);
	
	@Update("update orders set cancel=2 where orderId=${orderId}")
	int takePoint(int orderId);

	@Delete("delete from point where orderId=${orderId}")
	void delete(int orderId);

	@Select("select point from point where orderId=${orderId}")
	int selectPointByOrderId(int orderId);

}
