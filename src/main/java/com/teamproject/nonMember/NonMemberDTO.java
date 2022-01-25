
package com.teamproject.nonMember;

import java.sql.Date;

public class NonMemberDTO {

	
	private int orderId, itemId,  orderPrice, cancle, standardPeople, maxPeople;
	private String checkIn, checkOut, tid, notPhone, notName;
	private Date  orderDate;
	
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
	public int getCancle() {
		return cancle;
	}
	public void setCancle(int cancle) {
		this.cancle = cancle;
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
}
