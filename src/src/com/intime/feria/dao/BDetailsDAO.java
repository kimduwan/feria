package com.intime.feria.dao;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.BDetail;

public interface BDetailsDAO {
	public int insert(BDetail bDetail);
}
