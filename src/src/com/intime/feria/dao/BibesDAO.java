package com.intime.feria.dao;

import java.util.List;

import com.intime.feria.vo.Bibe;
import com.intime.feria.vo.PageVO;

public interface BibesDAO {

	// 2020.08.07 이원희
	// 비베 검색 메서드
	public List<Bibe> selectSearch(String bibeName);

	public int insert(Bibe bibe);

	public int insertDetail(Bibe bibe);

	public List<Bibe> selectList(PageVO pageVO);

	// 0809 노수한
	public int selectTotal();
	// 0809 노수한

	// 2020-08-10 박혜림
	public List<Bibe> selectLikeBibe(int userNo);

	public Bibe selectOneLikeBibe(int bibeNo);

	public List<Bibe> selectOneLikeCocktail(int bibeNo);

	// 2020-08-11 박상훈 : 호스트가 받은 비베리스트 호출 추상메서드 선언
	public List<Bibe> selectHostsBibeDefault(Bibe bibe);

	public List<Bibe> selectHostBibeVal(Bibe bibe);
	
	public List<Bibe> selectBibeCommunity(PageVO pageVO);

}
