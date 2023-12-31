package com.semi.travelpalette.user.domain;

import java.util.Date;

public class User {
	private int userNo;
	private String userId;
	private String userPw;
	private String platformType;
	private Date userCreateDate;
	private Date userDeleteDate;
	private char userStatus;
	private char adminCheck;
	private String userName;
	private String userNickname;
	private String userGender;
	private String userEmail;
	private String userTel;
	private String userEmailStatus;
	private String userSmsStatus;
	
	public User() {
		super();
	}
	
	public User(String userId, String userName, String userNickname, String userGender, String userEmail) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userNickname = userNickname;
		this.userGender = userGender;
		this.userEmail = userEmail;
	}
	
	
	public User(String userId, String userPw) {
		super();
		this.userId = userId;
		this.userPw = userPw;
	}
	
	public User(int userNo, String userId, String userPw, String platformType, Date userCreateDate,
			Date userDeleteDate, char userStatus, char adminCheck, String userName, String userNickname,
			String userGender, String userEmail, String userTel, String userEmailStatus, String userSmsStatus) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.platformType = platformType;
		this.userCreateDate = userCreateDate;
		this.userDeleteDate = userDeleteDate;
		this.userStatus = userStatus;
		this.adminCheck = adminCheck;
		this.userName = userName;
		this.userNickname = userNickname;
		this.userGender = userGender;
		this.userEmail = userEmail;
		this.userTel = userTel;
		this.userEmailStatus = userEmailStatus;
		this.userSmsStatus = userSmsStatus;
	}

	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getPlatformType() {
		return platformType;
	}
	public void setPlatformType(String platformType) {
		this.platformType = platformType;
	}
	public Date getUserCreateDate() {
		return userCreateDate;
	}
	public void setUserCreateDate(Date userCreateDate) {
		this.userCreateDate = userCreateDate;
	}
	public Date getUserDeleteDate() {
		return userDeleteDate;
	}
	public void setUserDeleteDate(Date userDeleteDate) {
		this.userDeleteDate = userDeleteDate;
	}
	public char getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(char userStatus) {
		this.userStatus = userStatus;
	}
	public char getAdminCheck() {
		return adminCheck;
	}
	public void setAdminCheck(char adminCheck) {
		this.adminCheck = adminCheck;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserEmailStatus() {
		return userEmailStatus;
	}
	public void setUserEmailStatus(String userEmailStatus) {
		this.userEmailStatus = userEmailStatus;
	}
	public String getUserSmsStatus() {
		return userSmsStatus;
	}
	public void setUserSmsStatus(String userSmsStatus) {
		this.userSmsStatus = userSmsStatus;
	}
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", platformType=" + platformType
				+ ", userCreateDate=" + userCreateDate + ", userDeleteDate=" + userDeleteDate + ", userStatus="
				+ userStatus + ", adminCheck=" + adminCheck + ", userName=" + userName + ", userNickname="
				+ userNickname + ", userGender=" + userGender + ", userEmail=" + userEmail + ", userTel=" + userTel
				+ ", userEmailStatus=" + userEmailStatus + ", userSmsStatus=" + userSmsStatus + "]";
	}
	
	

}
