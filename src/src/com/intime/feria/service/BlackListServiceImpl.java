package com.intime.feria.service;

import org.springframework.stereotype.Service;

import com.intime.feria.dao.BlackListDAO;

/* 2020-08-07 장유정(기본세팅) 1 */
@Service
public class BlackListServiceImpl implements BlackListService {
	
	private BlackListDAO blackListDAO;
	
	public void setBlackListDAO(BlackListDAO blackListDAO) {
		this.blackListDAO = blackListDAO;
	}
}
