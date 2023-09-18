package com.semi.travelpalette.event.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class Event {
    private int eventNo;
    private String boardType;
    private String eventTitle;
    private String eventFileName;
    private String eventFileRename;
    private String eventFilePath;
    private long eventFileLength;
    private Date eventStartDate;
    private Date eventEndDate;
    private String eventPrecautions;
    private String eventInquiries;
    private Timestamp eventCreateDate;
    private Timestamp eventUpdateDate;
    private char eventStatus;
    
	public Event() {
		super();
	}

	public Event(int eventNo, String boardType, String eventTitle, String eventFileName, String eventFileRename,
			String eventFilePath, long eventFileLength, Date eventStartDate, Date eventEndDate, String eventPrecautions,
			String eventInquiries, Timestamp eventCreateDate, Timestamp eventUpdateDate, char eventStatus) {
		super();
		this.eventNo = eventNo;
		this.boardType = boardType;
		this.eventTitle = eventTitle;
		this.eventFileName = eventFileName;
		this.eventFileRename = eventFileRename;
		this.eventFilePath = eventFilePath;
		this.eventFileLength = eventFileLength;
		this.eventStartDate = eventStartDate;
		this.eventEndDate = eventEndDate;
		this.eventPrecautions = eventPrecautions;
		this.eventInquiries = eventInquiries;
		this.eventCreateDate = eventCreateDate;
		this.eventUpdateDate = eventUpdateDate;
		this.eventStatus = eventStatus;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventFileName() {
		return eventFileName;
	}

	public void setEventFileName(String eventFileName) {
		this.eventFileName = eventFileName;
	}

	public String getEventFileRename() {
		return eventFileRename;
	}

	public void setEventFileRename(String eventFileRename) {
		this.eventFileRename = eventFileRename;
	}

	public String getEventFilePath() {
		return eventFilePath;
	}

	public void setEventFilePath(String eventFilePath) {
		this.eventFilePath = eventFilePath;
	}

	public long getEventFileLength() {
		return eventFileLength;
	}

	public void setEventFileLength(long eventFileLength) {
		this.eventFileLength = eventFileLength;
	}

	public Date getEventStartDate() {
		return eventStartDate;
	}

	public void setEventStartDate(Date eventStartDate) {
		this.eventStartDate = eventStartDate;
	}

	public Date getEventEndDate() {
		return eventEndDate;
	}

	public void setEventEndDate(Date eventEndDate) {
		this.eventEndDate = eventEndDate;
	}

	public String getEventPrecautions() {
		return eventPrecautions;
	}

	public void setEventPrecautions(String eventPrecautions) {
		this.eventPrecautions = eventPrecautions;
	}

	public String getEventInquiries() {
		return eventInquiries;
	}

	public void setEventInquiries(String eventInquiries) {
		this.eventInquiries = eventInquiries;
	}

	public Timestamp getEventCreateDate() {
		return eventCreateDate;
	}

	public void setEventCreateDate(Timestamp eventCreateDate) {
		this.eventCreateDate = eventCreateDate;
	}

	public Timestamp getEventUpdateDate() {
		return eventUpdateDate;
	}

	public void setEventUpdateDate(Timestamp eventUpdateDate) {
		this.eventUpdateDate = eventUpdateDate;
	}

	public char getEventStatus() {
		return eventStatus;
	}

	public void setEventStatus(char eventStatus) {
		this.eventStatus = eventStatus;
	}

	@Override
	public String toString() {
		return "이벤트 [게시글번호=" + eventNo + ", 게시판 종류=" + boardType + ", 제목=" + eventTitle
				+ ", 이벤트 첨부 파일 이름=" + eventFileName + ", 이벤트 첨부 파일 리네임=" + eventFileRename + ", 이벤트 첨부 파일 경로="
				+ eventFilePath + ", 이벤트 첨부 파일 크기=" + eventFileLength + ", 이벤트시작일=" + eventStartDate
				+ ", 이벤트종료일=" + eventEndDate + ", 이벤트 유의사항=" + eventPrecautions + ", 이벤트 문의사항="
				+ eventInquiries + ", 게시글등록일=" + eventCreateDate + ", 게시글수정일=" + eventUpdateDate
				+ ", 게시글상태=" + eventStatus + "]";
	}

}
