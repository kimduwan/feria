package com.intime.feria.vo;

public class City {

	private int cityNo, upperCity;
	private String cityName;

	public City() {
		
	}
	
	public City(int cityNo) {
		super();
		this.cityNo = cityNo;
	}


	public int getCityNo() {
		return cityNo;
	}

	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}

	public int getUpperCity() {
		return upperCity;
	}

	public void setUpperCity(int upperCity) {
		this.upperCity = upperCity;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	
	
}
