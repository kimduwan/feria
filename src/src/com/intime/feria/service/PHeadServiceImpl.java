package com.intime.feria.service;

import java.util.List;

import com.intime.feria.dao.PHeadsDAO;
import com.intime.feria.vo.PHead;

public class PHeadServiceImpl implements PHeadService {
	
	private PHeadsDAO pheadsDAO;
	
	public void setHeadsDAO(PHeadsDAO headsDAO) {
		this.pheadsDAO = headsDAO;
	}
	
	/* 2020.08.09. Kelly */
	@Override
	public List<PHead> getUserPHeads(int userNo) {
		return pheadsDAO.selectListUserNo(userNo);
	}
	

}
