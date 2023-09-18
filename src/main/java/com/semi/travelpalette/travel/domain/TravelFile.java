package com.semi.travelpalette.travel.domain;

public class TravelFile {
	private int travelFileNo;
	private String travelFileName;
	private String travelFileRename;
	private String travelFilePath;
	private int travelNo;
	
	
	public TravelFile() {
		super();
	}

	public TravelFile(int travelNo, String travelFileName, String travelFileRename,
			String travelFilePath) {
		super();
		this.travelNo = travelNo;
		this.travelFileName = travelFileName;
		this.travelFileRename = travelFileRename;
		this.travelFilePath = travelFilePath;
	}
	
	public int getTravelFileNo() {
		return travelFileNo;
	}
	public void setTravelFileNo(int travelFileNo) {
		this.travelFileNo = travelFileNo;
	}
	public int getTravelNo() {
		return travelNo;
	}
	public void setTravelNo(int travelNo) {
		this.travelNo = travelNo;
	}
	public String getTravelFileName() {
		return travelFileName;
	}
	public void setTravelFileName(String travelFileName) {
		this.travelFileName = travelFileName;
	}
	public String getTravelFileRename() {
		return travelFileRename;
	}
	public void setTravelFileRename(String travelFileRename) {
		this.travelFileRename = travelFileRename;
	}
	public String getTravelFilePath() {
		return travelFilePath;
	}
	public void setTravelFilePath(String travelFilePath) {
		this.travelFilePath = travelFilePath;
	}
	@Override
	public String toString() {
		return "여행첨부파일 [첨부번호=" + travelFileNo + ", 여행지번호=" + travelNo + ", 첨부파일명="
				+ travelFileName + ", 첨부리네임=" + travelFileRename + ", 첨부경로=" + travelFilePath
				+ "]";
	}
	
	
}
