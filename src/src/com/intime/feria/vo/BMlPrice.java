package com.intime.feria.vo;

public class BMlPrice {
	

	
	private int mlPriceNo, bibeMl, bibePrice, bibeNo;
	
	public BMlPrice() {
		// TODO Auto-generated constructor stub
	}
	
	

	public BMlPrice(int bibeMl, int bibePrice, int bibeNo) {
		super();
		this.bibeMl = bibeMl;
		this.bibePrice = bibePrice;
		this.bibeNo = bibeNo;
	}



	public int getMlPriceNo() {
		return mlPriceNo;
	}

	public void setMlPriceNo(int mlPriceNo) {
		this.mlPriceNo = mlPriceNo;
	}

	public int getBibeMl() {
		return bibeMl;
	}

	public void setBibeMl(int bibeMl) {
		this.bibeMl = bibeMl;
	}

	public int getBibePrice() {
		return bibePrice;
	}

	public void setBibePrice(int bibePrice) {
		this.bibePrice = bibePrice;
	}

	public int getBibeNo() {
		return bibeNo;
	}

	public void setBibeNo(int bibeNo) {
		this.bibeNo = bibeNo;
	}
	
	
	
}
