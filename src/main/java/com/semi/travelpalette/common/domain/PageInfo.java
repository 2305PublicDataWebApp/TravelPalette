package com.semi.travelpalette.common.domain;

//페이징 처리 관련 클래스 VO
public class PageInfo {
	private int currentPage;
	private int recordCountPerPage;
	private int naviCountPerPage;
	private int startNavi;
	private int endNavi;
	private int totalCount;
	private int naviTotalCount;
	private String boardType;
	
	public PageInfo() {
		// TODO Auto-generated constructor stub
	}

	public PageInfo(int currentPage, int recordCountPerPage, int naviCountPerPage, int startNavi, int endNavi,
			int totalCount, int naviTotalCount) {
		super();
		this.currentPage = currentPage;
		this.recordCountPerPage = recordCountPerPage;
		this.naviCountPerPage = naviCountPerPage;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
		this.totalCount = totalCount;
		this.naviTotalCount = naviTotalCount;
	}

	public PageInfo(int currentPage, int recordCountPerPage, int naviCountPerPage, int startNavi, int endNavi,
			int totalCount, int naviTotalCount, String boardType) {
		super();
		this.currentPage = currentPage;
		this.recordCountPerPage = recordCountPerPage;
		this.naviCountPerPage = naviCountPerPage;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
		this.totalCount = totalCount;
		this.naviTotalCount = naviTotalCount;
		this.boardType = boardType;
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

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getNaviTotalCount() {
		return naviTotalCount;
	}

	public void setNaviTotalCount(int naviTotalCount) {
		this.naviTotalCount = naviTotalCount;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	
	@Override
	public String toString() {
		return "페이징 [전체개수=" + totalCount + ", 현재페이지=" + currentPage + ", 페이지당게시물수="
				+ recordCountPerPage + ", 페이지당네비수=" + naviCountPerPage + ", 네비전체개수=" + naviTotalCount
				+ ", 시작네비=" + startNavi + ", 끝네비=" + endNavi + "]";
	}
	
}