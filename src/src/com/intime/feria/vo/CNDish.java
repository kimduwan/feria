package com.intime.feria.vo;

public class CNDish {
	private int ccookNo, cenaNo, cookNo;
	
	public CNDish() {
		// TODO Auto-generated constructor stub
	}

	public int getCcookNo() {
		return ccookNo;
	}

	public void setCcookNo(int ccookNo) {
		this.ccookNo = ccookNo;
	}

	public int getCenaNo() {
		return cenaNo;
	}

	public void setCenaNo(int cenaNo) {
		this.cenaNo = cenaNo;
	}

	public int getCookNo() {
		return cookNo;
	}

	public void setCookNo(int cookNo) {
		this.cookNo = cookNo;
	}

	public CNDish(int cenaNo, int cookNo) {
		super();
		this.cenaNo = cenaNo;
		this.cookNo = cookNo;
	}
	
}
