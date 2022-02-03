package com.teamproject.order;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.teamproject.reservation.reservationDTO;

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

	@Insert("insert into orders(memberId, "
			 				 + "itemRoomId, "
			 				 + "checkIn, "
			 				 + "checkOut, "
			 				 + "orderPrice, "
			 				 + "cancel, "
			 				 + "tid) "
			 				 + "values(#{memberId}, "
			 				 		+ "#{itemRoomId}, "
			 				 		+ "#{checkIn}, "
			 				 		+ "#{checkOut}, "
			 				 		+ "#{orderPrice}, "
			 				 		+ "2, "
			 				 		+ "#{tid})")
	int insert2(OrderDTO orderDto);
	
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

	@Select("select * from orders A join item_room B " + 
			"on A.itemRoomId = B.itemRoomId and A.orderId = ${orderId} order by checkIn")
	List<reservationDTO> getOrder(int orderId);

	@Update("update orders set cancel=0 where orderId=${orderId}")
	int orderCancle(int orderId);

	@Select("select * from orders where tid=#{tid}")
	OrderDTO selectByTid(String tid);


}
