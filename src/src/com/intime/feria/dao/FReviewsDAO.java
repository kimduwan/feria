package com.intime.feria.dao;

import java.util.List;

import com.intime.feria.vo.FImage;
import com.intime.feria.vo.FReview;

/* 2020-08-07 장유정(기본세팅) */
public interface FReviewsDAO {
	// 2020-08-08 김우석 추가
	public int insert(FReview fReview);

	// 2020-08-13 박상훈
	public List<FReview> selectHostsFReviews(int userNo);

	// 2020-08-13 박상훈
	public int selectReviewTotal(int userNo);
}
