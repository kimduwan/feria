package com.intime.feria.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.intime.feria.dao.FriendsDAO;
import com.intime.feria.dao.RequestsDAO;
import com.intime.feria.vo.Friend;

/* 2020-08-07 장유정(기본세팅) */
public interface FriendService {
	
	//0809 정예찬 친구요청
	public void request(String email, PrintWriter out, 
			HttpServletRequest req, HttpServletResponse resp);
	
	//0809 정예찬 친구요청 목록
	public Map<String, Object> getRequestList(int pageNo, int memberNo);
	
	//0809 정예찬 친구목록
	public Map<String, Object> getFriendList(int pageNo, int memberNo);
	
	//2020-08-10 장유정 친구리스트
	public List<Friend> prtcFriendList(int no);
	
}
