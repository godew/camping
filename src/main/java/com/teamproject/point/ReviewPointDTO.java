package com.teamproject.point;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReviewPointDTO {
	
	private int memberID, rpoint;
	private String title;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date reviewDate;
	
	public int getMemberID() {
		return memberID;
	}
	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}
	public int getRpoint() {
		return rpoint;
	}
	public void setRpoint(int rpoint) {
		this.rpoint = rpoint;
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
