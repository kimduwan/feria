package com.intime.feria.service;

import java.util.List;

import com.intime.feria.vo.CNAllergy;
import com.intime.feria.vo.CNDish;
import com.intime.feria.vo.Cena;
import com.intime.feria.vo.Dish;

/* 2020-08-07 장유정(기본세팅) */
public interface CenaService {
	public int uploadCena(Cena cena);
	public int uploadCnAllegies(Cena cena);
	public int uploadCnDishes(Cena cena);
}
