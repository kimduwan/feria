package com.intime.feria.service;

import java.util.List;

import com.intime.feria.vo.BReview;
import com.intime.feria.vo.FImage;
import com.intime.feria.vo.FReview;

/* 2020-08-07 장유정(기본세팅) */
public interface FReviewService {
	// 2020-08-08 김우석 추가
	public int uploadFReview(FReview fReview);

	public int uploadFImage(FImage fImage);

	public int uploadBibeReview(BReview bReview);

	// 2020-08-13 박상훈
	public List<FReview> getHostsReviews(int userNo);

	// 2020-08-13 박상훈
	public int getHostsReviewTotal(int userNo);
}
