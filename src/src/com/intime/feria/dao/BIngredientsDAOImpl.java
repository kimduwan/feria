package com.intime.feria.dao;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.BIngredient;

public class BIngredientsDAOImpl implements BIngredientsDAO {
	
	/* 2020.08.07. Kelly - 기본세팅 */
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(BIngredient bIngredient) {
		
		return session.insert("bIngredients.insert", bIngredient);
	}

}
