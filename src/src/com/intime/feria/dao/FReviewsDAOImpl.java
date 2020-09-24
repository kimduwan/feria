package com.intime.feria.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.FReview;

public class FReviewsDAOImpl implements FReviewsDAO {

	/* 2020-08-07 장유정(기본세팅) */
	// 멤버필드
	private SqlSession session;

	// setter
	public void setSession(SqlSession session) {
		this.session = session;
	}

	/* 2020 08 08 김우석 추가 */
	@Override
	public int insert(FReview fReview) {
		// TODO Auto-generated method stub
		return session.insert("fReviews.insert", fReview);
	}

	// 2020-08-13 박상훈
	@Override
	public List<FReview> selectHostsFReviews(int userNo) {
		return session.selectList("fReviews.selectHostsFReviews", userNo);
	}

	// 2020-08-13 박상훈
	@Override
	public int selectReviewTotal(int userNo) {
		return session.selectOne("fReviews.selectReviewTotal", userNo);
	}
}
