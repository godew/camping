package com.teamproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamproject.order.OrderDAO;
import com.teamproject.order.OrderDTO;

@Service
public class OrderService {
	
	@Autowired private OrderDAO dao;

	public int add(OrderDTO orderDto) {
		return dao.insert(orderDto);
	}
}
