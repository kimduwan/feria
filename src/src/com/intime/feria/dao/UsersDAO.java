package com.intime.feria.dao;

import java.util.List;

import com.intime.feria.vo.Gugun;
import com.intime.feria.vo.PageVO;
import com.intime.feria.vo.User;

public interface UsersDAO {
	
	/* 2020-08-07 장유정(기본세팅) */
	public User selectLogin(User user);
	
	public List<User> selectUserList();
	public int selectOne(String email);
	public int selectCheckEmail(String email);
	public int insert(User user);
	public int selectTotalInvited();
	public int updateMypageFeriaPrivate(int prtcCntNo);
	public List<User> selectMypageFeriaList(PageVO pageVO);
	public List<Gugun> selectGugunList(String cityNo);
	//예약된 페리아 전체 개수
	public int selectTotal(int no);
	//사람 초대 수 구하기 이원희
	public int selectTotalInvite(int no);
	//페리아에 초대 받은 횟 수
	public int selectTotalInvited(int no);
	
}
