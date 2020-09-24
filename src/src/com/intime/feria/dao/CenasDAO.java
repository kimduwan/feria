package com.intime.feria.dao;

import com.intime.feria.vo.Cena;

public interface CenasDAO {
	
	/* 2020.08.07. Kelly - 기본세팅 */
	public int insert(Cena cena);
	
	public int selectCena(Cena cena);
	
	/* 2020 08 13 김우석 작성*/
	public int insertcnAllegies(Cena cena);
	/* 2020 08 13 김우석 작성*/
	public int insertCnDishes(Cena cena);
}
