package com.intime.feria.service;

import java.util.List;

import com.intime.feria.vo.BReview;

/* 2020-08-07 장유정(기본세팅) */
public interface BReviewService {

	// 2020-08-13 박상훈
	public List<BReview> getHostsBreviews(int frNo);

}
