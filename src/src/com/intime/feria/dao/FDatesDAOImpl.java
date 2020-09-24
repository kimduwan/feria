package com.intime.feria.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.Black;
import com.intime.feria.vo.FDate;
import com.intime.feria.vo.PageVO;

public class FDatesDAOImpl implements FDatesDAO {
	
	/* 2020-08-07 장유정(기본세팅) */
	// 멤버필드
	private SqlSession session;
	
	// setter
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<FDate> selectList(PageVO pageVO) {
		return session.selectList("fDates.selectList", pageVO);
	}
	
	/*2020-08-08 김우석 추가*/
	@Override
	/*
	 * 필요한 맴버 필드:
	 * 	-hostNo
	 * 	-guestNo
	 * */
	public int selectAddBlacklist(FDate fDate) {
		return session.selectOne("fDates.selectAddBlackList",fDate);
	};
	/*
	 * fDateNo
	 * */
	@Override
	public List<FDate> selectFdateImg(int fDateNo) {
		return session.selectList("fDates.selectFdateImg",fDateNo);
	}
	
	@Override
	/*
	 * 	-fDateNo
	 * */
	public int selectHost(int fDateNo) {
		// TODO Auto-generated method stub
		return session.selectOne("fDates.selectHost",fDateNo);
	}
	
	@Override
	/*
	 * 	-fDateNo
	 * */
	public FDate selectOne(int fDateNo) {
		// TODO Auto-generated method stub
		return session.selectOne("fDates.selectOne",fDateNo);
	}
	
	@Override
	/*
	 * 필요한 맴버 필드:
	 * 	-fDateNo
	 * 	-guestNo
	 * */
	public int selectOkToReview(FDate fDate) {
		// TODO Auto-generated method stub
		return session.selectOne("fDates.selectOkToReview",fDate);
	}
	
	@Override
	/*
	 * fDateNo
	 * */
	public List<FDate> selectBibeList(int fDateNo) {
		// TODO Auto-generated method stub
		return session.selectList("fDates.selectBibeList",fDateNo);
	}
	
	//2020.08.12 이원희
	@Override
	public int insert(FDate fDate) {
		// TODO Auto-generated method stub
		return session.insert("fDates.insert", fDate);
	}
	
	
	//2020.08.13 조현득
	@Override
	public List<FDate> selectListBob(PageVO pageVO) {
		return session.selectList("fDates.selectListBob", pageVO);
	}
	
	@Override
	public List<FDate> selectListSul(PageVO pageVO) {
		return session.selectList("fDates.selectListSul", pageVO);
	}
	
	/*2020 08 11 김우석 추가*/
	@Override
	public List<FDate> selectBibeDetailList(int fDateNo) {
		// TODO Auto-generated method stub
		return session.selectList("fDates.selectBibeDetailList",fDateNo);
	}
	/*2020 08 13 김우석 추가*/
	@Override
	public FDate selectOneDetail(int fDateNo) {
		// TODO Auto-generated method stub
		return session.selectOne("fDates.selectOneDetail",fDateNo);
	}
	/*2020 08 13 김우석 추가*/
	@Override
	public int selectAddBlackList(Black black) {
		// TODO Auto-generated method stub
		return session.selectOne("fDates.selectAddBlackList",black);
	}
	/*2020 08 13 김우석 추가*/
	@Override
	public int insertBlackList(Black black) {
		// TODO Auto-generated method stub
		return session.insert("fDates.insertBlackList",black);
	}
	
	@Override
	public int selectFeriaCommTotal() {
		
		return session.selectOne("fDates.selectFeriaCommTotal");
	}
	
}
