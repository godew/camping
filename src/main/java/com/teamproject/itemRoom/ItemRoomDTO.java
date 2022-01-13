package com.teamproject.itemRoom;

public class ItemRoomDTO {
    private int itemRoomId;
    private int itemId;
    private String itemRoomName;
    private String itemRoomImage;
    private int itemRoomPrice;
    private String standardPeople;
    private String maxPeople;
    
	public int getItemRoomId() {
		return itemRoomId;
	}
	public void setItemRoomId(int itemRoomId) {
		this.itemRoomId = itemRoomId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
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
	public int getItemRoomPrice() {
		return itemRoomPrice;
	}
	public void setItemRoomPrice(int itemRoomPrice) {
		this.itemRoomPrice = itemRoomPrice;
	}
	public String getStandardPeople() {
		return standardPeople;
	}
	public void setStandardPeople(String standardPeople) {
		this.standardPeople = standardPeople;
	}
	public String getMaxPeople() {
		return maxPeople;
	}
	public void setMaxPeople(String maxPeople) {
		this.maxPeople = maxPeople;
	}
}
