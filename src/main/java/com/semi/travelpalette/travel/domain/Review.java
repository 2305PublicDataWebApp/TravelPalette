package com.semi.travelpalette.travel.domain;

import java.sql.Timestamp;

public class Review {
	private int reviewNo;
	private String reviewContent;
	private Timestamp reviewCreateDate;
	private int reviewRating;
	private char reviewStatus;
	private String userId;
	private int travelNo;
	private String boardType;
	
	
	public Review() {
		super();
	}
	
	public Review(String userId, int travelNo) {
		super();
		this.userId = userId;
		this.travelNo = travelNo;
	}


	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Timestamp getReviewCreateDate() {
		return reviewCreateDate;
	}
	public void setReviewCreateDate(Timestamp reviewCreateDate) {
		this.reviewCreateDate = reviewCreateDate;
	}
	public int getReviewRating() {
		return reviewRating;
	}
	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}
	public char getReviewStatus() {
		return reviewStatus;
	}
	public void setReviewStatus(char reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getTravelNo() {
		return travelNo;
	}
	public void setTravelNo(int travelNo) {
		this.travelNo = travelNo;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	
	@Override
	public String toString() {
		return "리뷰 [리뷰번호=" + reviewNo + ", 내용=" + reviewContent + ", 작성일="
				+ reviewCreateDate + ", 별점=" + reviewRating + ", 리뷰상태=" + reviewStatus
				+ ", 작성자아이디=" + userId + ", 여행지번호=" + travelNo + ", 게시판종류=" + boardType + "]";
	}
	
	
	
	
}
