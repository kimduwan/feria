package com.intime.feria.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.City;

public class CitiesDAOImpl implements CitiesDAO {
	
	/* 2020.08.07. Kelly - 기본세팅 */
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<City> selectGugun(int cityNo) {
		return session.selectList("cities.selectGugun", cityNo);
	}
	
	@Override
	public List<City> selectSi() {
		return session.selectList("cities.selectSi");
	}
	
	//2020.08.11 이원희
	@Override
	public int selectCityNo(String cityName) {
		
		return session.selectOne("cities.selectCityNo", "%" +cityName+ "%");
	}
	
}
