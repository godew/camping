package com.teamproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.order.OrderDAO;
import com.teamproject.order.OrderDTO;
import com.teamproject.reservation.reservationDTO;

@Service
public class OrderService {
	
	@Autowired private OrderDAO dao;

	public int add(OrderDTO orderDto) {
		return dao.insert(orderDto);
	}

	public int add2(OrderDTO orderDto) {
		return dao.insert2(orderDto);
		
	}
	
	public int addNot(OrderDTO orderDto) {
		return dao.insertNot(orderDto);
	}

	public List<reservationDTO> getOrder(int orderId) {
		return dao.getOrder(orderId);
	}

	public int orderCancle(int orderId) {
		return dao.orderCancle(orderId);
	}

	public OrderDTO getOrderByTid(String tid) {
		return dao.selectByTid(tid);
	}
}
