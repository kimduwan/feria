package com.intime.feria.dao;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.Gugun;
import com.intime.feria.vo.Sido;

public class SidosDAOImpl implements SidosDAO {

	/* 2020-08-07 장유정(기본세팅) */
	// 멤버필드
	private SqlSession session;
	
	// setter
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insertSido(Sido sido) {
		return session.insert("sidos.insertSido",sido);
	}
	
	@Override
	public int insertGugun(Gugun gugun) {
		return session.insert("sidos.insertGugun",gugun);
	}
	
	
}
