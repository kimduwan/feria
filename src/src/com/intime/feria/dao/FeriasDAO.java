package com.intime.feria.dao;

import java.util.List;

import com.intime.feria.vo.Feria;
import com.intime.feria.vo.PHead;
import com.intime.feria.vo.PageVO;

public interface FeriasDAO {

	/* 2020-08-07 장유정(기본세팅) */
	public List<Feria> selectList(PageVO pageVO);

	/* 2020-08-07 오후 11시54분 노수한(진행중인 페리아 페이지 select) */
	public List<Feria> selectListByFeria(PageVO pageVO);

	public int selectTotal();

	public List<PHead> selectByProfileList(int fDateNo);
	/* 2020-08-09 오후 1시18분 노수한(진행중인 페리아 페이지 유저select) */

	/* 2020-08-12 이원희 */
	public int insert(Feria feria);

	// 2020-08-12 박상훈
	public List<Feria> selectHostsFeiraList(PageVO pageVO);

	public int selectHostsFeriaTotal(int no);

}
