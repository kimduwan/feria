package com.intime.feria.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.Feria;
import com.intime.feria.vo.PHead;
import com.intime.feria.vo.PageVO;

public class FeriasDAOImpl implements FeriasDAO {

	/* 2020-08-07 장유정(기본세팅) */
	// 멤버필드
	private SqlSession session;

	// setter
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Feria> selectList(PageVO pageVO) {
		return session.selectList("ferias.selectList", pageVO);
	}

	/* 2020-08-07 오후 11시54분 노수한(진행중인 페리아 페이지 select) */
	@Override
	public List<Feria> selectListByFeria(PageVO pageVO) {
		return session.selectList("ferias.selectListByFeria", pageVO);
	}

	@Override
	public int selectTotal() {
		// TODO Auto-generated method stub
		return session.selectOne("ferias.selectTotal");
	}

	@Override
	public List<PHead> selectByProfileList(int fDateNo) {
		// TODO Auto-generated method stub
		return session.selectList("pHeads.selectByProfileList", fDateNo);
	}
	/* 2020-08-09 오후 1시18분 노수한(진행중인 페리아 페이지 유저select) */

	/* 2020-08-12 이원희 */
	@Override
	public int insert(Feria feria) {
		// TODO Auto-generated method stub
		return session.insert("ferias.insert", feria);
	}

	// 2020-08-12 박상훈
	@Override
	public List<Feria> selectHostsFeiraList(PageVO pageVO) {
		return session.selectList("ferias.selectHostsFeiraList", pageVO);
	}

	// 2020-08-12 박상훈
	@Override
	public int selectHostsFeriaTotal(int no) {
		return session.selectOne("ferias.selectHostsFeriaTotal", no);
	}
}
