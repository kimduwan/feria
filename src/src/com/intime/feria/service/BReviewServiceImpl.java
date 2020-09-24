package com.intime.feria.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.intime.feria.dao.BReviewsDAO;
import com.intime.feria.vo.BReview;

@Service
public class BReviewServiceImpl implements BReviewService {

	/* 2020-08-07 박상훈 기본세팅 */

	// 멤버필드
	private BReviewsDAO bReviewsDAO;

	// Setter
	public void setbReviewsDAO(BReviewsDAO bReviewsDAO) {
		this.bReviewsDAO = bReviewsDAO;
	}

	// 2020-08-13 박상훈
	@Override
	public List<BReview> getHostsBreviews(int frNo) {
		return bReviewsDAO.selectHostsBreviews(frNo);
	}

}
