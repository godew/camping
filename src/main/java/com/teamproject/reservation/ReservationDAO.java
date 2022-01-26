package com.teamproject.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ReservationDAO {

	@Select("select * from orders A join item_room B " + 
			"on A.itemRoomId = B.itemRoomId and A.memberId = ${memberId} order by checkIn")
	List<reservationDTO> getReservation(int memberId);
}
