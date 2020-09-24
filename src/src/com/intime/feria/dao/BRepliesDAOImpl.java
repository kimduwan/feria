package com.intime.feria.dao;

import org.apache.ibatis.session.SqlSession;

public class BRepliesDAOImpl implements BRepliesDAO {
	
	/* 2020.08.07. Kelly - 기본세팅 */
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

}
