package com.spring.collabee.biz.admingoods;

public class PaginationVO {
	private int currentPageNo; //현재 페이지 번호
	private int recordCountPerPage; //한 페이지당 게시되는 게시물 수
	private int pageSize; //페이지 리스트에 게시되는 페이지 수
	private int totalRecordCount; //전체 게시물 수
	private int firstPageNoOnPageList; //페이지 리스트의 첫 페이지 번호
	private int lastPageNoOnPageList; //페이지 리스트의 마지막 페이지 번호
	private int firstRecordIndex; //페이징 sql의 조건절에 사용되는 시작 rownum
	private int xprev; //이전버튼
	private int xnext; //다음버튼
	private int realEnd; //페이징 마지막 숫자
	
	
	public PaginationVO(int currentPageNo, int recordCountPerPage, int pageSize, int totalRecordCount,
			int firstPageNoOnPageList, int lastPageNoOnPageList, int firstRecordIndex, int xprev, int xnext,
			int realEnd) {
		super();
		this.currentPageNo = currentPageNo;
		this.recordCountPerPage = recordCountPerPage;
		this.pageSize = pageSize;
		this.totalRecordCount = totalRecordCount;
		this.firstPageNoOnPageList = firstPageNoOnPageList;
		this.lastPageNoOnPageList = lastPageNoOnPageList;
		this.firstRecordIndex = firstRecordIndex;
		this.xprev = xprev;
		this.xnext = xnext;
		this.realEnd = realEnd;
	}


	public int getCurrentPageNo() {
		return currentPageNo;
	}


	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}


	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}


	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getTotalRecordCount() {
		return totalRecordCount;
	}


	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}


	public int getFirstPageNoOnPageList() { 
		lastPageNoOnPageList = (int)(Math.ceil(currentPageNo/10.0)) * 10;
		
		firstPageNoOnPageList = lastPageNoOnPageList - 9;
		return firstPageNoOnPageList;
	}


	public void setFirstPageNoOnPageList(int firstPageNoOnPageList) {
		this.firstPageNoOnPageList = firstPageNoOnPageList;
	}


	public int getLastPageNoOnPageList() {
		lastPageNoOnPageList = (int)(Math.ceil(getCurrentPageNo()/10.0)) * 10;
		int realEnd = (int)(Math.ceil((getTotalRecordCount() * 1.0) / getRecordCountPerPage()));

		if (realEnd < lastPageNoOnPageList) { //realEnd가 마지막 페이지 번호보다 작을 경우 마지막 페이지 번호와 같도록 처리
			lastPageNoOnPageList = realEnd; 
		}
		return lastPageNoOnPageList;
	}


	public void setLastPageNoOnPageList(int lastPageNoOnPageList) {
		this.lastPageNoOnPageList = lastPageNoOnPageList;
	}


	public int getFirstRecordIndex() {
		//firstRecordIndex
		return firstRecordIndex;
	}


	public void setFirstRecordIndex(int firstRecordIndex) {
		this.firstRecordIndex = firstRecordIndex;
	}


	public int getXprev() {
		return xprev;
	}


	public void setXprev(int xprev) {
		this.xprev = xprev;
	}


	public int getXnext() {
		return xnext;
	}


	public void setXnext(int xnext) {
		this.xnext = xnext;
	}


	public int getRealEnd() {
		return realEnd;
	}


	public void setRealEnd(int realEnd) {
		this.realEnd = realEnd;
	}


	@Override
	public String toString() {
		return "PaginationVO [currentPageNo=" + currentPageNo + ", recordCountPerPage=" + recordCountPerPage
				+ ", pageSize=" + pageSize + ", totalRecordCount=" + totalRecordCount + ", firstPageNoOnPageList="
				+ firstPageNoOnPageList + ", lastPageNoOnPageList=" + lastPageNoOnPageList + ", firstRecordIndex="
				+ firstRecordIndex + ", xprev=" + xprev + ", xnext=" + xnext + ", realEnd=" + realEnd + "]";
	}
	
	
}
