package com.semi.travelpalette.community.domain;

import java.sql.Timestamp;

public class Reply {
	private int replyNo;
	private int boardNo;
	private String boardType;
	private char replySecretType;
	private String replyContent;
	private Timestamp replyCreateDate;
	private Timestamp replyUpdateDate;
	private String userId;
	private String userNickname;
	private char replyStatus;
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
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
	public char getReplySecretType() {
		return replySecretType;
	}
	public void setReplySecretType(char replySecretType) {
		this.replySecretType = replySecretType;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Timestamp getReplyCreateDate() {
		return replyCreateDate;
	}
	public void setReplyCreateDate(Timestamp replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}
	public Timestamp getReplyUpdateDate() {
		return replyUpdateDate;
	}
	public void setReplyUpdateDate(Timestamp replyUpdateDate) {
		this.replyUpdateDate = replyUpdateDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public char getReplyStatus() {
		return replyStatus;
	}
	public void setReplyStatus(char replyStatus) {
		this.replyStatus = replyStatus;
	}
	
	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", boardNo=" + boardNo + ", boardType=" + boardType + ", replySecretType="
				+ replySecretType + ", replyContent=" + replyContent + ", replyCreateDate=" + replyCreateDate
				+ ", replyUpdateDate=" + replyUpdateDate + ", userId=" + userId + ", userNickname=" + userNickname
				+ ", replyStatus=" + replyStatus + "]";
	}
	
}