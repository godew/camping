package com.teamproject.manager;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface ManagerDAO {

	@Select("select count(*) from orders where memberId is not null")
	String countUser();

	@Select("select count(*) from orders where memberId is null")
	String countNotUser();

	@Select("select sum(orderPrice) from orders where TO_CHAR(orderDate, 'MM/DD')='${month}/${day}' and memberId is not null")
	String selectUserOrderPrice(@Param("month") String month, @Param("day") String day);

	@Select("select sum(orderPrice) from orders where TO_CHAR(orderDate, 'MM/DD')='${month}/${day}' and memberId is null")
	String selectNotUserOrderPrice(@Param("month") String month, @Param("day") String day);
}
