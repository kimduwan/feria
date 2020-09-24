package com.intime.feria.vo;

import java.util.List;

public class Sido {

	private int sidoCd;
	private String name;
	private List<Gugun> gugun;
	
	public Sido() {
		// TODO Auto-generated constructor stub
	}
	
	public Sido(int sidoCd, String name) {
		super();
		this.sidoCd = sidoCd;
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public int getSidoCd() {
		return sidoCd;
	}

	public void setSidoCd(int sidoCd) {
		this.sidoCd = sidoCd;
	}

	public List<Gugun> getGugun() {
		return gugun;
	}

	public void setGugun(List<Gugun> gugun) {
		this.gugun = gugun;
	}
	
	
}
