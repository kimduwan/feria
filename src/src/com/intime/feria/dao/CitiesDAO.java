package com.intime.feria.dao;

import java.util.List;

import com.intime.feria.vo.City;

public interface CitiesDAO {
	
	/* 2020.08.07. Kelly - 기본세팅 */
	public List<City> selectGugun(int cityNo);
	
	public List<City> selectSi();
	
	//2020.08.11 이원희
	public int selectCityNo(String cityName);
	
}
