package com.teamproject.order;

import java.sql.Date;

public class OrderDTO {
	private int orderId;
	private int memberId;
	private int itemRoomId;
	private Date orderDate;
	private String checkIn;
	private String checkOut;
	private int orderPrice;
	private String tid;
	private String notPhone;
	private String notName;
	private int cancel;
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getItemRoomId() {
		return itemRoomId;
	}
	public void setItemRoomId(int itemRoomId) {
		this.itemRoomId = itemRoomId;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getNotPhone() {
		return notPhone;
	}
	public void setNotPhone(String notPhone) {
		this.notPhone = notPhone;
	}
	public String getNotName() {
		return notName;
	}
	public void setNotName(String notName) {
		this.notName = notName;
	}
	public int getCancel() {
		return cancel;
	}
	public void setCancel(int cancel) {
		this.cancel = cancel;
	}
}
