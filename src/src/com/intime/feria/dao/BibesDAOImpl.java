package com.intime.feria.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.Bibe;
import com.intime.feria.vo.PageVO;
import com.intime.feria.vo.User;

public class BibesDAOImpl implements BibesDAO {

	/* 2020.08.07. Kelly - 기본세팅 */
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 2020.08.07 이원희
	// 비베 검색 메서드
	@Override
	public List<Bibe> selectSearch(String bibeName) {
		// TODO Auto-generated method stub
		return session.selectList("bibes.selectSearch", "%" + bibeName + "%");
	}

	@Override
	public int insert(Bibe bibe) {

		return session.insert("bibes.bibeInsert", bibe);
	}

	@Override
	public int insertDetail(Bibe bibe) {

		return session.insert("bibes.bibeDetailInsert", bibe);
	}

	@Override
	public List<Bibe> selectList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("bibes.selectList", pageVO);
	}// selectList 0809-4시 노수한

	@Override
	public int selectTotal() {
		// TODO Auto-generated method stub
		return session.selectOne("bibes.selectTotal");
	}// selectList 0809-4시37분 노수한

	// 유저가 라이크에 추가한 비베 가져오기
	@Override
	public List<Bibe> selectLikeBibe(int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("bibes.selectBtype", userNo);
	}

	// 유저가 라이크에 추가한 비베 정보 가져오기
	@Override
	public Bibe selectOneLikeBibe(int bibeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("bibes.selectOneLikeBibe", bibeNo);
	}

	// 유저가 라이크에 추가한 칵테일 정보 가져오기
	@Override
	public List<Bibe> selectOneLikeCocktail(int bibeNo) {
		// TODO Auto-generated method stub
		return session.selectList("bibes.selectOneLikeCocktail", bibeNo);
	}


	// 2020-08-11 박상훈 추상메서드 구현
	@Override
	public List<Bibe> selectHostsBibeDefault(Bibe bibe) {
		System.out.println("DAO :" + bibe.getVal());
		return session.selectList("bibes.selectHostsBibeDefault", bibe);
	}

	@Override
	public List<Bibe> selectHostBibeVal(Bibe bibe) {
		System.out.println("DAO :" + bibe.getVal());
		return session.selectList("bibes.selectHostBibeVal", bibe);
	}
	
	@Override
	public List<Bibe> selectBibeCommunity(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("bibes.selectListByBibeCummu", pageVO);
	}
}
