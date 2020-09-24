package com.intime.feria.vo;

public class Dish {
	private int cookNo;
	private String cookName;
	
	public Dish() {
		// TODO Auto-generated constructor stub
	}

	public int getCookNo() {
		return cookNo;
	}

	public void setCookNo(int cookNo) {
		this.cookNo = cookNo;
	}

	public String getCookName() {
		return cookName;
	}

	public void setCookName(String cookName) {
		this.cookName = cookName;
	}

	public Dish(int cookNo) {
		super();
		this.cookNo = cookNo;
	}
}
