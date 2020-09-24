package com.intime.feria.service;

import org.springframework.stereotype.Service;

import com.intime.feria.dao.BRepliesDAO;

@Service
public class BReplyServiceImpl implements BReplyService {

	//2020.08.07 이원희 기본세팅
		private BRepliesDAO bRepliesDAO;
		public void setbRepliesDAO(BRepliesDAO bRepliesDAO) {
			this.bRepliesDAO = bRepliesDAO;
		}
	
}
