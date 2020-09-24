package com.intime.feria.service;

import org.springframework.stereotype.Service;

import com.intime.feria.dao.UBibesDAO;

/* 2020-08-07 장유정(기본세팅) */
@Service
public class UBibeServiceImpl implements UBibeService {
	
	//2020.08.07 이원희 기본세팅
		private UBibesDAO uBibesDAO;
		public void setuBibesDAO(UBibesDAO uBibesDAO) {
			this.uBibesDAO = uBibesDAO;
		}

}
