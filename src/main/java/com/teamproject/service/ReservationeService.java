package com.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.reservation.ReservationDAO;
import com.teamproject.reservation.reservationDTO;
import com.teamproject.review.ReviewDAO;
import com.teamproject.review.ReviewDTO;

@Service
public class ReservationeService {
	
	@Autowired private ReservationDAO dao;
	@Autowired private ReviewDAO rdao;
	public List<reservationDTO> getReservation(int memberId) {
		return dao.getReservation(memberId);
	}


}
