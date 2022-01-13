package com.teamproject.point;

import java.sql.Date;

public class OrderPointDTO {

	private int memberID, opoint;
	private String title;
	private Date reviewDate;
	
	public int getMemberID() {
		return memberID;
	}
	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}
	public int getOpoint() {
		return opoint;
	}
	public void setOpoint(int opoint) {
		this.opoint = opoint;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	
}
