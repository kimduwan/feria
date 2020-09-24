package com.intime.feria.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.PageVO;
import com.intime.feria.vo.Request;

public class RequestsDAOImpl implements RequestsDAO {
	
	/* 2020-08-07 장유정(기본세팅) */
	// 멤버필드
	private SqlSession session;
	
	// setter
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(Request request) {
		return session.insert("requests.insert", request);
	}
	
	@Override
	public List<Request> selectRequestList(PageVO pageVO) {
		return session.selectList("requests.selectRequestList", pageVO);
	}
	
	@Override
	public int selectTotal(int user2) {
		return session.selectOne("requests.selectTotal", user2);
	}
	
	@Override
	public int updateAccept(Request request) {
		return session.update("requests.updateAccept", request);
	}
	
	@Override
	public int updateReject(Request request) {
		return session.update("requests.updateReject", request);
	}
	
	@Override
	public String checkRequest(Request request) {
		return session.selectOne("requests.checkRequest", request);
	}
}
