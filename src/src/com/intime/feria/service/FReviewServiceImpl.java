package com.intime.feria.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.intime.feria.dao.BReviewsDAO;
import com.intime.feria.dao.FImagesDAO;
import com.intime.feria.dao.FReviewsDAO;
import com.intime.feria.vo.BReview;
import com.intime.feria.vo.FImage;
import com.intime.feria.vo.FReview;

/* 2020-08-07 장유정(기본세팅) 1 */
@Service
public class FReviewServiceImpl implements FReviewService {

	private FReviewsDAO fReviewsDAO;
	// 2020 08 10 김우석 세팅
	private FImagesDAO fImagesDAO;
	private BReviewsDAO bReviewsDAO;

	public void setfReviewsDAO(FReviewsDAO fReviewsDAO) {
		this.fReviewsDAO = fReviewsDAO;
	}

	public void setbReviewsDAO(BReviewsDAO bReviewsDAO) {
		this.bReviewsDAO = bReviewsDAO;
	}

	public void setfImagesDAO(FImagesDAO fImagesDAO) {
		this.fImagesDAO = fImagesDAO;
	}
	
	//2020.08.14 김우석
	@Override
	public int uploadFReview(FReview fReview) {
		// TODO Auto-generated method stub
		return fReviewsDAO.insert(fReview);
	}

	@Override
	public int uploadFImage(FImage fImage) {
		// TODO Auto-generated method stub
		return fImagesDAO.insert(fImage);
	}

	public int uploadBibeReview(BReview bReview) {
		return bReviewsDAO.insert(bReview);
	}

	// 2020-08-13 박상훈
	@Override
	public List<FReview> getHostsReviews(int userNo) {
		return fReviewsDAO.selectHostsFReviews(userNo);
	}

	// 2020-08-13 박상훈
	@Override
	public int getHostsReviewTotal(int userNo) {
		return fReviewsDAO.selectReviewTotal(userNo);
	}

}
