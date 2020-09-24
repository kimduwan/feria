package com.intime.feria.dao;

import java.util.List;

import com.intime.feria.vo.PHead;

public interface PHeadsDAO {
	
	/* 2020-08-07 장유정(기본세팅) */
	public List<PHead> selectList(int no);
	public List<PHead> selectListUserNo(int userNo);
}
