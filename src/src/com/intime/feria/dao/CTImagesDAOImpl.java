package com.intime.feria.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.CTImage;

public class CTImagesDAOImpl implements CTImagesDAO {
	
	/* 2020-08-07 장유정(기본세팅) */
	// 멤버필드
	private SqlSession session;
	
	// setter
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	
	/* 2020-08-07 장유정 */
	@Override
	public List<CTImage> selectRandomCityImg(int cityNo) {
		return session.selectList("ctImages.randomCityImg", cityNo);
	}
}
