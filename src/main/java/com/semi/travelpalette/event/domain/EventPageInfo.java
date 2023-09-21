package com.semi.travelpalette.event.domain;

public class EventPageInfo {
	private int totalCount;
	private int currentPage;
	private int recordCountPerPage;
	private int naviCountPerPage;
	private int naviTotalCount;
	private int startNavi;
	private int endNavi;
	
	
	public EventPageInfo() {
		super();
	}

	public EventPageInfo(int totalCount, int currentPage, int recordCountPerPage, int naviCountPerPage,
			int naviTotalCount, int startNavi, int endNavi) {
		super();
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.recordCountPerPage = recordCountPerPage;
		this.naviCountPerPage = naviCountPerPage;
		this.naviTotalCount = naviTotalCount;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public int getNaviCountPerPage() {
		return naviCountPerPage;
	}
	public void setNaviCountPerPage(int naviCountPerPage) {
		this.naviCountPerPage = naviCountPerPage;
	}
	public int getNaviTotalCount() {
		return naviTotalCount;
	}
	public void setNaviTotalCount(int naviTotalCount) {
		this.naviTotalCount = naviTotalCount;
	}
	public int getStartNavi() {
		return startNavi;
	}
	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}
	public int getEndNavi() {
		return endNavi;
	}
	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}

	@Override
	public String toString() {
		return "EventPageInfo [totalCount=" + totalCount + ", currentPage=" + currentPage + ", recordCountPerPage="
				+ recordCountPerPage + ", naviCountPerPage=" + naviCountPerPage + ", naviTotalCount=" + naviTotalCount
				+ ", startNavi=" + startNavi + ", endNavi=" + endNavi + "]";
	}

}
