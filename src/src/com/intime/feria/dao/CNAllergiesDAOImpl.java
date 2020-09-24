package com.intime.feria.dao;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.CNAllergy;

public class CNAllergiesDAOImpl implements CNAllergiesDAO {
	
	/* 2020.08.07. Kelly - 기본세팅 */
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(CNAllergy cNAllergy) {
		return session.insert("cNAllergies.insert", cNAllergy);
	}
	
}
