package com.intime.feria.vo;

public class BIngredient {
	
	private int ingNo, ingRatio, bibeIng, bibeNo;
	
	public BIngredient() {
		// TODO Auto-generated constructor stub
	}
	
	

	public BIngredient(int ingRatio, int bibeIng, int bibeNo) {
		super();
		this.ingRatio = ingRatio;
		this.bibeIng = bibeIng;
		this.bibeNo = bibeNo;
	}

	public int getIngNo() {
		return ingNo;
	}

	public void setIngNo(int ingNo) {
		this.ingNo = ingNo;
	}

	public int getIngRatio() {
		return ingRatio;
	}

	public void setIngRatio(int ingRatio) {
		this.ingRatio = ingRatio;
	}

	public int getBibeIng() {
		return bibeIng;
	}

	public void setBibeIng(int bibeIng) {
		this.bibeIng = bibeIng;
	}

	public int getBibeNo() {
		return bibeNo;
	}

	public void setBibeNo(int bibeNo) {
		this.bibeNo = bibeNo;
	}
	
	
}
