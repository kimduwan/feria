package com.intime.feria.dao;

import java.util.List;

import com.intime.feria.vo.FImage;
import com.intime.feria.vo.PageVO;

public interface FImagesDAO {

	/* 2020-08-07 장유정(기본세팅) */
	public List<FImage> selectList(int no);

	// 2020 0810 김우석 추가
	public int insert(FImage fImage);

	//2020.08.12 이원희
	public List<FImage> selectFeriaComm(PageVO pageVO);
}
