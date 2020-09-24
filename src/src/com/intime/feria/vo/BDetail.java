package com.intime.feria.vo;

public class BDetail {
	
	
	private int bibeNo;
	private String bibeBrand;
	private double bibeAvb;
	
	public BDetail() {
		// TODO Auto-generated constructor stub
	}
	
	

	public BDetail(int bibeNo, String bibeBrand, double bibeAvb) {
		super();
		this.bibeNo = bibeNo;
		this.bibeBrand = bibeBrand;
		this.bibeAvb = bibeAvb;
	}



	public int getBibeNo() {
		return bibeNo;
	}

	public void setBibeNo(int bibeNo) {
		this.bibeNo = bibeNo;
	}

	public String getBibeBrand() {
		return bibeBrand;
	}

	public void setBibeBrand(String bibeBrand) {
		this.bibeBrand = bibeBrand;
	}

	public double getBibeAVB() {
		return bibeAvb;
	}

	public void setBibeAVB(double bibeAVB) {
		this.bibeAvb = bibeAVB;
	}
	
	
}
