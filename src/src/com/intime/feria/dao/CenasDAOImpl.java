package com.intime.feria.dao;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.Cena;

public class CenasDAOImpl implements CenasDAO {
	
	/* 2020.08.07. Kelly - 기본세팅 */
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(Cena cena) {
		return session.insert("cenas.insert", cena);
	}
	
	@Override
	public int selectCena(Cena cena) {
		return session.selectOne("cenas.selectCena", cena);
	}
	
	/*2020 08 13 김우석 작성*/
	@Override
	public int insertcnAllegies(Cena cena) {
		// TODO Auto-generated method stub
		return session.insert("cenas.insertCnAllegies",cena);
	}
	
	/*2020 08 13 김우석 작성*/
	@Override
	public int insertCnDishes(Cena cena) {
		// TODO Auto-generated method stub
		return session.insert("cenas.insertCnDishes",cena);
	}

}
