package com.intime.feria.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.BReview;

public class BReviewsDAOImpl implements BReviewsDAO {

	/* 2020.08.07. Kelly - 기본세팅 */
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	/* 2020 08 10 김우석 추가 */
	@Override
	public int insert(BReview bReview) {
		// TODO Auto-generated method stub
		return session.insert("bReviews.insert", bReview);
	}

	// 2020-08-13 박상훈
	@Override
	public List<BReview> selectHostsBreviews(int frNo) {
		return session.selectList("bReviews.selectHostsBreviews", frNo);
	}

}
