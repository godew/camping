package com.teamproject.manager;

import org.apache.ibatis.annotations.Select;

public interface ManagerDAO {

	@Select("select count(*) from orders where memberId is not null")
	String countUser();

	@Select("select count(*) from orders where memberId is null")
	String countNotUser();
}
