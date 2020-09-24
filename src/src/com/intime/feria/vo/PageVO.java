package com.intime.feria.vo;

public class PageVO {
	
	private int start, end, userNo;
	
	public PageVO() {
		// TODO Auto-generated constructor stub
	}

	public PageVO(int pageNo, int numPage) {
		end = pageNo * numPage;
		start = end-numPage+1;
	}
	
	public PageVO(int pageNo, 
			int numPage,
			int userNo) {
		end = pageNo * numPage;
		start = end-numPage+1;
		this.userNo = userNo;
	}

	public int getNo() {
		return userNo;
	}

	public void setNo(int no) {
		this.userNo = userNo;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
}
