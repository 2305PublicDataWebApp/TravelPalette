package com.semi.travelpalette.inquiry.domain;

import java.util.Date;

public class Inquiry {
	private int inquiryNo;
	private String inquiryTitle;
	private String inquiryContent;
	private String userId;
	private Date inquiryCreateDate;
	private Date inquiryUpdateDate;
	private Date inquiryDeleteDate;
	private String inquiryFileName;
	private String inquiryFileRename;
	private String inquiryFilePath;
	private long inquiryFileLength;
	private char inquiryResponse;
	private char inquiryStatus;
	
	public Inquiry() {
		super();
	}
	
	public Inquiry(int inquiryNo, String userId) {
		super();
		this.inquiryNo = inquiryNo;
		this.userId = userId;
	}

	public int getInquiryNo() {
		return inquiryNo;
	}
	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}
	public String getInquiryTitle() {
		return inquiryTitle;
	}
	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}
	public String getInquiryContent() {
		return inquiryContent;
	}
	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getInquiryCreateDate() {
		return inquiryCreateDate;
	}
	public void setInquiryCreateDate(Date inquiryCreateDate) {
		this.inquiryCreateDate = inquiryCreateDate;
	}
	
	public Date getInquiryUpdateDate() {
		return inquiryUpdateDate;
	}

	public void setInquiryUpdateDate(Date inquiryUpdateDate) {
		this.inquiryUpdateDate = inquiryUpdateDate;
	}

	public Date getInquiryDeleteDate() {
		return inquiryDeleteDate;
	}
	public void setInquiryDeleteDate(Date inquiryDeleteDate) {
		this.inquiryDeleteDate = inquiryDeleteDate;
	}
	public String getInquiryFileName() {
		return inquiryFileName;
	}
	public void setInquiryFileName(String inquiryFileName) {
		this.inquiryFileName = inquiryFileName;
	}
	public String getInquiryFileRename() {
		return inquiryFileRename;
	}
	public void setInquiryFileRename(String inquiryFileRename) {
		this.inquiryFileRename = inquiryFileRename;
	}
	public String getInquiryFilePath() {
		return inquiryFilePath;
	}
	public void setInquiryFilePath(String inquiryFilePath) {
		this.inquiryFilePath = inquiryFilePath;
	}
	public long getInquiryFileLength() {
		return inquiryFileLength;
	}
	public void setInquiryFileLength(long inquiryFileLength) {
		this.inquiryFileLength = inquiryFileLength;
	}
	public char getInquiryResponse() {
		return inquiryResponse;
	}
	public void setInquiryResponse(char inquiryResponse) {
		this.inquiryResponse = inquiryResponse;
	}
	public char getInquiryStatus() {
		return inquiryStatus;
	}
	public void setInquiryStatus(char inquiryStatus) {
		this.inquiryStatus = inquiryStatus;
	}
	@Override
	public String toString() {
		return "문의사항 [문의글 번호=" + inquiryNo + ", 문의글 제목=" + inquiryTitle + ", 문의글 내용="
				+ inquiryContent + ", 작성자 아이디=" + userId + ", 문의글 작성일=" + inquiryCreateDate
				+ ", 문의글 수정일="+inquiryUpdateDate+", 문의글 삭제일=" + inquiryDeleteDate + ", 문의글 파일명=" + inquiryFileName
				+ ", 문의글 파일 리네임명=" + inquiryFileRename + ", 문의글 파일 경로=" + inquiryFilePath
				+ ", 문의글 파일 크기=" + inquiryFileLength + ", 문의글 답변 여부=" + inquiryResponse 
				+ ", 문의글 상태=" + inquiryStatus + "]";
	}

}
