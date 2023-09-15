package com.semi.travelpalette.travel.domain;

import java.sql.Timestamp;

public class Travel {
	private int travelNo;
	private String travelName;
	private String travelAddr;
	private String travelInfo;
	private String travelUrl;
	private String travelTel;
	private String travelUsingTime;
	private String travelHoliday;
	private String travelParking;
	private String travelLocation;
	private String travelTags;
	private Timestamp travelCreateDate;
	private Timestamp travelUpdateDate;
	private int travelViewCount;
	private String travelStatus;
	private String BoardType;
	
	
	public Travel() {
		super();
	}
	
	public int getTravelNo() {
		return travelNo;
	}
	public void setTravelNo(int travelNo) {
		this.travelNo = travelNo;
	}
	public String getTravelName() {
		return travelName;
	}
	public void setTravelName(String travelName) {
		this.travelName = travelName;
	}
	public String getTravelAddr() {
		return travelAddr;
	}
	public void setTravelAddr(String travelAddr) {
		this.travelAddr = travelAddr;
	}
	public String getTravelInfo() {
		return travelInfo;
	}
	public void setTravelInfo(String travelInfo) {
		this.travelInfo = travelInfo;
	}
	public String getTravelUrl() {
		return travelUrl;
	}
	public void setTravelUrl(String travelUrl) {
		this.travelUrl = travelUrl;
	}
	public String getTravelTel() {
		return travelTel;
	}
	public void setTravelTel(String travelTel) {
		this.travelTel = travelTel;
	}
	public String getTravelUsingTime() {
		return travelUsingTime;
	}
	public void setTravelUsingTime(String travelUsingTime) {
		this.travelUsingTime = travelUsingTime;
	}
	public String getTravelHoliday() {
		return travelHoliday;
	}
	public void setTravelHoliday(String travelHoliday) {
		this.travelHoliday = travelHoliday;
	}
	public String getTravelParking() {
		return travelParking;
	}
	public void setTravelParking(String travelParking) {
		this.travelParking = travelParking;
	}
	public String getTravelLocation() {
		return travelLocation;
	}
	public void setTravelLocation(String travelLocation) {
		this.travelLocation = travelLocation;
	}
	public String getTravelTags() {
		return travelTags;
	}
	public void setTravelTags(String travelTags) {
		this.travelTags = travelTags;
	}
	public Timestamp getTravelCreateDate() {
		return travelCreateDate;
	}
	public void setTravelCreateDate(Timestamp travelCreateDate) {
		this.travelCreateDate = travelCreateDate;
	}
	public Timestamp getTravelUpdateDate() {
		return travelUpdateDate;
	}
	public void setTravelUpdateDate(Timestamp travelUpdateDate) {
		this.travelUpdateDate = travelUpdateDate;
	}
	public int getTravelViewCount() {
		return travelViewCount;
	}
	public void setTravelViewCount(int travelViewCount) {
		this.travelViewCount = travelViewCount;
	}
	
	public String getTravelStatus() {
		return travelStatus;
	}

	public void setTravelStatus(String travelStatus) {
		this.travelStatus = travelStatus;
	}

	public String getBoardType() {
		return BoardType;
	}
	public void setBoardType(String boardType) {
		BoardType = boardType;
	}

	@Override
	public String toString() {
		return "여행정보 [여행지번호=" + travelNo + ", 여행지명=" + travelName + ", 주소=" + travelAddr
				+ ", 소개글=" + travelInfo + ", 홈페이지=" + travelUrl + ", 연락처=" + travelTel
				+ ", 이용시간=" + travelUsingTime + ", 휴일=" + travelHoliday + ", 주차="
				+ travelParking + ", 지역키워드=" + travelLocation + ", 테마키워드=" + travelTags
				+ ", 등록일=" + travelCreateDate + ", 수정일=" + travelUpdateDate
				+ ", 조회수=" + travelViewCount + ", 글상태="+ travelStatus + ", 게시판종류=" + BoardType + "]";
	}
	
	
	
}
