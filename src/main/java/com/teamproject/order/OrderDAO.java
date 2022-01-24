package com.teamproject.order;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

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

	@Select("select * from orders where orderId=${orderId}")
	List<OrderDTO> getOrder(int orderId);

	@Delete("delete from orders where orderId=${orderId}")
	int orderDelete(int orderId);
}
