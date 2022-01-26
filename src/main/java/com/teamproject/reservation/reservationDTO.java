package com.teamproject.reservation;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class reservationDTO {

	private int orderId, memberId, itemRoomId, orderPrice, cancel, itemId, satandardPeople, maxPeople;
	private String tid,checkIn, checkOut, notPhone, notName, itemRoomName;
	private Date orderDate;
	private MultipartFile itemRoomImg;
	
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
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public int getCancel() {
		return cancel;
	}
	public void setCancel(int cancel) {
		this.cancel = cancel;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getSatandardPeople() {
		return satandardPeople;
	}
	public void setSatandardPeople(int satandardPeople) {
		this.satandardPeople = satandardPeople;
	}
	public int getMaxPeople() {
		return maxPeople;
	}
	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
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
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public MultipartFile getItemRoomImg() {
		return itemRoomImg;
	}
	public void setItemRoomImg(MultipartFile itemRoomImg) {
		this.itemRoomImg = itemRoomImg;
	}
	public String getItemRoomName() {
		return itemRoomName;
	}
	public void setItemRoomName(String itemRoomName) {
		this.itemRoomName = itemRoomName;
	}
}
