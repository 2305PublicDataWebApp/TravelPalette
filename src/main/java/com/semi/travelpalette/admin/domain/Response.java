package com.semi.travelpalette.admin.domain;

import java.sql.Timestamp;

public class Response {
    private int responseNo;
    private int inquiryNo;
    private String responseContent;
    private Timestamp responseCreateDate;
    private Timestamp responseUpdateDate;
    
	public int getResponseNo() {
		return responseNo;
	}
	public void setResponseNo(int responseNo) {
		this.responseNo = responseNo;
	}
	public int getInquiryNo() {
		return inquiryNo;
	}
	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}
	public String getResponseContent() {
		return responseContent;
	}
	public void setResponseContent(String responseContent) {
		this.responseContent = responseContent;
	}
	public Timestamp getResponseCreateDate() {
		return responseCreateDate;
	}
	public 
	void setResponseCreateDate(Timestamp responseCreateDate) {
		this.responseCreateDate = responseCreateDate;
	}
	public Timestamp getResponseUpdateDate() {
		return responseUpdateDate;
	}
	public void setResponseUpdateDate(Timestamp responseUpdateDate) {
		this.responseUpdateDate = responseUpdateDate;
	}
	
	@Override
	public String toString() {
		return "Response [responseNo=" + responseNo + ", inquiryNo=" + inquiryNo + ", responseContent="
				+ responseContent + ", responseCreateDate=" + responseCreateDate + ", responseUpdateDate="
				+ responseUpdateDate + "]";
	}
    
    
}
