package com.teamproject.order;

import org.apache.ibatis.annotations.Insert;

public interface OrderDAO {

	@Insert("insert into orders(memberId, "
							 + "itemRoomId, "
							 + "checkIn, "
							 + "checkOut, "
							 + "orderPrice, "
							 + "tid) "
							 + "values(#{memberId}, "
							 		+ "#{itemRoomId}, "
							 		+ "#{checkIn}, "
							 		+ "#{checkOut}, "
							 		+ "#{orderPrice}, "
							 		+ "#{tid})")
	int insert(OrderDTO orderDto);

	
	@Insert("insert into orders(notPhone, "
			 				 + "itemRoomId, "
			 				 + "checkIn, "
			 				 + "checkOut, "
			 				 + "orderPrice, "
			 				 + "notName, "
			 				 + "tid) "
			 				 + "values(#{notPhone}, "
			 		  		 	    + "#{itemRoomId}, "
			 		  		 	    + "#{checkIn}, "
			 		  		 	    + "#{checkOut}, "
			 		  		 	    + "#{orderPrice}, "
			 		  		 	    + "#{notName}, "
			 		  		 	    + "#{tid})")
	int insertNot(OrderDTO orderDto);
}
