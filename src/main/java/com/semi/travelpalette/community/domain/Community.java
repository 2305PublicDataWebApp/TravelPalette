package com.semi.travelpalette.community.domain;

import java.sql.Timestamp;

public class Community {
	
	private int boardNo;
	private String boardTitle;
	private String boardType;
	private String boardContent;
	private String userId;
	private Timestamp boardCreateDate;
	private Timestamp boardUpdateDate;
	private int viewCount;
	private char boardStatus;
	private String userNickName;
	private String boardFileName;
	private String boardFileRename;
	private String boardFilePath;
	private long BoardFileLength;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Timestamp getBoardCreateDate() {
		return boardCreateDate;
	}
	public void setBoardCreateDate(Timestamp boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}
	public Timestamp getBoardUpdateDate() {
		return boardUpdateDate;
	}
	public void setBoardUpdateDate(Timestamp boardUpdateDate) {
		this.boardUpdateDate = boardUpdateDate;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public char getBoardStatus() {
		return boardStatus;
	}
	public void setBoardStatus(char boardStatus) {
		this.boardStatus = boardStatus;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getBoardFileName() {
		return boardFileName;
	}
	public void setBoardFileName(String boardFileName) {
		this.boardFileName = boardFileName;
	}
	public String getBoardFileRename() {
		return boardFileRename;
	}
	public void setBoardFileRename(String boardFileRename) {
		this.boardFileRename = boardFileRename;
	}
	public String getBoardFilePath() {
		return boardFilePath;
	}
	public void setBoardFilePath(String boardFilePath) {
		this.boardFilePath = boardFilePath;
	}
	public long getBoardFileLength() {
		return BoardFileLength;
	}
	public void setBoardFileLength(long boardFileLength) {
		BoardFileLength = boardFileLength;
	}
	@Override
	public String toString() {
		return "Ŀ�´�Ƽ [�Խñ� ��ȣ=" + boardNo + ", �Խñ� ����=" + boardTitle + ", �Խ��� ����=" + boardType
				+ ", �Խ��� ����=" + boardContent + ", �ۼ��� ���̵�=" + userId + ", �ۼ� ��¥=" + boardCreateDate
				+ ", ���� ��¥=" + boardUpdateDate + ", ��ȸ��=" + viewCount + ", ����=" + boardStatus
				+ ", �г���=" + userNickName + ", ÷�����ϸ�=" + boardFileName + ", ÷�θ�����="
				+ boardFileRename + ", ÷�ΰ��=" + boardFilePath + ", ÷��ũ��=" + BoardFileLength + "]";
	}
	
	
	
}
