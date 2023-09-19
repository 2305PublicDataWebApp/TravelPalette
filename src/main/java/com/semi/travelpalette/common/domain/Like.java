package com.semi.travelpalette.common.domain;

import java.sql.Timestamp;

public class Like {
	
	private int likeNo;
	private int boardNo;
	private String boardType;
	private int replyNo;
	private String likeType;
	private Timestamp likeCreateDate;
	private String userId;
	
	public Like() {}
	
	public Like(int boardNo, String boardType, String userId) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.userId = userId;
	}

	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getLikeType() {
		return likeType;
	}
	public void setLikeType(String likeType) {
		this.likeType = likeType;
	}
	public Timestamp getLikeCreateDate() {
		return likeCreateDate;
	}
	public void setLikeCreateDate(Timestamp likeCreateDate) {
		this.likeCreateDate = likeCreateDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "평가 [번호=" + likeNo + ", 게시물 번호=" + boardNo + ", 게시판 타입=" + boardType + ", 댓글 번호=" + replyNo
				+ ", 평가 타입=" + likeType + ", 좋아요 누른 날짜=" + likeCreateDate + ", 아이디=" + userId + "]";
	}
	
	
}
