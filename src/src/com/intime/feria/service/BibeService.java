package com.intime.feria.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.intime.feria.vo.BDetail;
import com.intime.feria.vo.BIngredient;
import com.intime.feria.vo.BMlPrice;
import com.intime.feria.vo.Bibe;
import com.intime.feria.vo.PageVO;

/* 2020-08-07 장유정(기본세팅) */
public interface BibeService {

	// 2020.08.07 이원희
	// 비베 검색 메서드
	public List<Bibe> bibeSearch(String bibeName);

	// 2020.08.09 이원희
	// 비베 인서트 메서드
	public void addBibe(Bibe bibe, String bibeBrand, double bibeAvb, int[] bibeMl, int[] bibePrice, HttpSession session,
			int[] ingRatio, int[] bibeIng);

	public Map<String, Object> getBibeLists(int page);
	// 0809 - 노수한

	/* 2020.08.07. Kelly */
	public List<Bibe> getSearchBibe(String bibeName);

	public List<Bibe> getLikeBibe(int userNo);

	public Bibe getLikeBibeDetail(int bibeNo);

	public List<Bibe> getLikeCocktail(int bibeNo);

	// 2020-08-12 박상훈
	public List<Bibe> getHostsBibeList(Bibe bibe);
	
	public List<Bibe> getBibeComm(int page);

}
