package com.semi.travelpalette.common.domain;

public class BoardViewCount {
	
	private int boardNo;
	private String boardType;
	private String userId;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
	public String toString() {
		return "게시물 조회수 [게시물 번호=" + boardNo + ", 게시물 타입=" + boardType + ", 아이디=" + userId + "]";
	}	
}
