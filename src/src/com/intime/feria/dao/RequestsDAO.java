package com.intime.feria.dao;

import java.util.List;

import com.intime.feria.vo.PageVO;
import com.intime.feria.vo.Request;

public interface RequestsDAO {
	
	/* 2020-08-07 장유정(기본세팅) */
	public int insert(Request request);
	public List<Request> selectRequestList(PageVO pageVO);
	public int selectTotal(int user2);
	public int updateAccept(Request request);
	public int updateReject(Request request);
	public String checkRequest(Request request);
	
}
