package com.intime.feria.dao;

import java.util.List;

import com.intime.feria.vo.Dish;

public interface DishesDAO {
	
	/* 2020-08-07 장유정(기본세팅) */
	public Dish selectDishNoCheck(String cookName);
	public List<Dish> selectDishCheck(String cookName);
	public int selectDish();
	public int insert(Dish dish);
	public List<Dish> selectList();
}
