package com.intime.feria.dao;

import java.util.List;

import com.intime.feria.vo.Black;
import com.intime.feria.vo.FDate;
import com.intime.feria.vo.PageVO;

public interface FDatesDAO {
	
	/* 2020-08-07 장유정(기본세팅) */
	public List<FDate> selectList(PageVO pageVO);
	
	/*2020-0808 김우석 추가*/
	public List<FDate> selectFdateImg(int fDateNo);
	public FDate selectOne(int fDateNo);
	public List<FDate> selectBibeList(int fDateNo);
	public int selectHost(int fDateNo);
	public int selectOkToReview(FDate fDate);
	public int selectAddBlacklist(FDate fDate);
	
	//2020.08.12 이원희
	public int insert(FDate fDate);
	
	//2020.08.13 조현득
	public List<FDate> selectListBob(PageVO pageVO);
	public List<FDate> selectListSul(PageVO pageVO);
	
	/*2020 -0811 김우석 추가*/
	public List<FDate>selectBibeDetailList(int fDateNo);
	public FDate selectOneDetail(int fDateNo);
	/*2020 08 13 김우석 추가*/
	public int selectAddBlackList(Black black);
	public int insertBlackList(Black black);
	
	//2020.08.11
	public int selectFeriaCommTotal();
}
