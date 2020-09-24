package com.intime.feria.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.FImage;
import com.intime.feria.vo.PageVO;

public class FImagesDAOImpl implements FImagesDAO {

	/* 2020-08-07 장유정(기본세팅) */
	// 멤버필드
	private SqlSession session;
	
	// setter
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<FImage> selectList(int no) {
		return session.selectList("fImages.selectList", no);
	}
	/*2020 08 10 김우석 추가*/
	@Override
	public int insert(FImage fImage) {
		// TODO Auto-generated method stub
		return session.insert("fImages.insert",fImage);
	}
	
	//2020.08.12 이원희
	@Override
	public List<FImage> selectFeriaComm(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("fImages.selectFeriaComm",pageVO);
	}
	
}
