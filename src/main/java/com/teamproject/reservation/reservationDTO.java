package com.teamproject.reservation;

import java.sql.Date;

public class reservationDTO {

	private int orderId, memberId, itemRoomId, orderprice, cancel;
	private String tid,checkIn, checkOut;
	private Date orderDate;
	
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
	public int getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(int orderprice) {
		this.orderprice = orderprice;
	}
	public int getCancel() {
		return cancel;
	}
	public void setCanel(int cancle) {
		this.cancel = cancle;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
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
}
