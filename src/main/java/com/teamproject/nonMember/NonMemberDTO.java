
package com.teamproject.nonMember;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NonMemberDTO {

	
	private int orderId, itemId, orderPrice, cancel, standardPeople, maxPeople;
	private String checkIn, checkOut, tid, notPhone, notName,itemRoomName;
	private Date  orderDate;
	private String itemRoomImage;
	
	
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public int getStandardPeople() {
		return standardPeople;
	}
	public void setStandardPeople(int standardPeople) {
		this.standardPeople = standardPeople;
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
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getMaxPeople() {
		return maxPeople;
	}
	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}
	public String getItemRoomName() {
		return itemRoomName;
	}
	public void setItemRoomName(String itemRoomName) {
		this.itemRoomName = itemRoomName;
	}
	public String getItemRoomImage() {
		return itemRoomImage;
	}
	public void setItemRoomImage(String itemRoomImage) {
		this.itemRoomImage = itemRoomImage;
	}
	public int getCancel() {
		return cancel;
	}
	public void setCancel(int cancel) {
		this.cancel = cancel;
	}
}
