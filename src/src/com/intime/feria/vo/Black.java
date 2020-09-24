package com.intime.feria.vo;

import java.sql.Date;

public class Black {
	private int blackNo;
	private int userNo;
	private int userNo2;
	private Date blackRegdate;
	
	public Black() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Black(int userNo, int userNo2) {
		super();
		this.userNo = userNo;
		this.userNo2 = userNo2;
	}



	public Black(int blackNo, int userNo, int userNo2, Date blackRegdate) {
		super();
		this.blackNo = blackNo;
		this.userNo = userNo;
		this.userNo2 = userNo2;
		this.blackRegdate = blackRegdate;
	}
	public int getBlackNo() {
		return blackNo;
	}
	public void setBlackNo(int blackNo) {
		this.blackNo = blackNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getUserNo2() {
		return userNo2;
	}
	public void setUserNo2(int userNo2) {
		this.userNo2 = userNo2;
	}
	public Date getBlackRegdate() {
		return blackRegdate;
	}
	public void setBlackRegdate(Date blackRegdate) {
		this.blackRegdate = blackRegdate;
	}
}
