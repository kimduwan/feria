package com.intime.feria.dao;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.BDetail;

public class BDetailsDAOImpl implements BDetailsDAO {
	
	/* 2020.08.07. Kelly - 기본세팅 */
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(BDetail bDetail) {
		
		return session.insert("bDetails.Insert", bDetail);
	}

}
