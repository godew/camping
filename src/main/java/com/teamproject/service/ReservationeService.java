package com.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.reservation.ReservationDAO;
import com.teamproject.reservation.reservationDTO;

@Service
public class ReservationeService {
	
	@Autowired private ReservationDAO dao;

	public List<reservationDTO> getReservation(int memberId) {
//		reservationDTO dto = new reservationDTO();
//		SimpleDateFormat sdf = dto.getCheckIn("yyyy-MM-dd E요일 HH:mm");
		
		return dao.getReservation(memberId);
	}

}
