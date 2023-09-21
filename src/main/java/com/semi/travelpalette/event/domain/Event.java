package com.semi.travelpalette.event.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class Event {
    private int eventNo;
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
    private String eventMoveUrl;
    
    
    public Event() {
		// TODO Auto-generated constructor stub
	}

    
	public int getEventNo() {
		return eventNo;
	}


	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
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


	public String getEventMoveUrl() {
		return eventMoveUrl;
	}


	public void setEventMoveUrl(String eventMoveUrl) {
		this.eventMoveUrl = eventMoveUrl;
	}


	@Override
	public String toString() {
		return "Event [eventNo=" + eventNo + ", eventTitle=" + eventTitle + ", eventFileName=" + eventFileName
				+ ", eventFileRename=" + eventFileRename + ", eventFilePath=" + eventFilePath + ", eventFileLength="
				+ eventFileLength + ", eventStartDate=" + eventStartDate + ", eventEndDate=" + eventEndDate
				+ ", eventPrecautions=" + eventPrecautions + ", eventInquiries=" + eventInquiries + ", eventCreateDate="
				+ eventCreateDate + ", eventUpdateDate=" + eventUpdateDate + ", eventStatus=" + eventStatus
				+ ", eventMoveUrl=" + eventMoveUrl + "]";
	}

}
