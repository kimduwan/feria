package com.intime.feria.vo;

public class CNAllergy {
	private int cenaNo, caNo, alleNo;
	
	public CNAllergy() {
		// TODO Auto-generated constructor stub
	}

	public int getCenaNo() {
		return cenaNo;
	}

	public void setCenaNo(int cenaNo) {
		this.cenaNo = cenaNo;
	}

	public int getCaNo() {
		return caNo;
	}

	public void setCaNo(int caNo) {
		this.caNo = caNo;
	}

	public int getAlleNo() {
		return alleNo;
	}

	public void setAlleNo(int alleNo) {
		this.alleNo = alleNo;
	}

	public CNAllergy(int cenaNo, int alleNo) {
		super();
		this.cenaNo = cenaNo;
		this.alleNo = alleNo;
	}
	
}
