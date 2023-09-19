package com.semi.travelpalette.community.domain;

import java.sql.Timestamp;

public class Community {
	
	private int boardNo;
	private String boardTitle;
	private String boardType;
	private String boardContent;
	private String userId;
	private String userNickname;
	private Timestamp boardCreateDate;
	private Timestamp boardUpdateDate;
	private int viewCount;
	private char boardStatus;
	private String boardFileName;
	private String boardFileRename;
	private String boardFilePath;
	private long boardFileLength;
	private int likeNo;
	
	public Community() {}
	public Community(int boardNo, String boardType) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
	}


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
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
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
		return boardFileLength;
	}
	public void setBoardFileLength(long boardFileLength) {
		this.boardFileLength = boardFileLength;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	
	@Override
	public String toString() {
		return "커뮤니티 [게시판 번호=" + boardNo + ", 게시물 제목=" + boardTitle + ", 게시판 타입=" + boardType
				+ ", 게시물 내용=" + boardContent + ", 아이디=" + userId + ", 닉네임=" + userNickname 
				+ ", 작성날짜=" + boardCreateDate + ", 수정날짜=" + boardUpdateDate + ", 조회수=" + viewCount 
				+ ", 상태=" + boardStatus + ", 파일이름=" + boardFileName + ", 파일리네임="+ boardFileRename 
				+ ", 파일 경로=" + boardFilePath + ", 파일 길이=" + boardFileLength + ", 좋아요 개수 "+ likeNo + "]";
	}
	
	
	
}
