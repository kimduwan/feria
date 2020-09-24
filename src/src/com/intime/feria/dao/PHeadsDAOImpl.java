package com.intime.feria.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.PHead;

public class PHeadsDAOImpl implements PHeadsDAO {

	/* 2020-08-07 장유정(기본세팅) */
	// 멤버필드
	private SqlSession session;
	
	// setter
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<PHead> selectList(int no) {
		return session.selectList("pHeads.selectList", no);
	}
	
	@Override
	public List<PHead> selectListUserNo(int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("pHeads.selectListUserNo", userNo);
	}
	
}
