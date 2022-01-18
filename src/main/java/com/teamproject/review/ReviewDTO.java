package com.teamproject.review;

import org.springframework.web.multipart.MultipartFile;

public class ReviewDTO {

	private int idx, memberId, starPoint;
	private String title, itemId;
	private MultipartFile img;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getStarPoint() {
		return starPoint;
	}
	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public MultipartFile getImg() {
		return img;
	}
	public void setImg(MultipartFile img) {
		this.img = img;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
}
