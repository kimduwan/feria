package com.intime.feria.service;

import org.springframework.stereotype.Service;

import com.intime.feria.dao.CNAllergiesDAO;
import com.intime.feria.dao.CNDishesDAO;
import com.intime.feria.dao.CenasDAO;
import com.intime.feria.dao.DishesDAO;
import com.intime.feria.vo.Cena;

/* 2020-08-07 장유정(기본세팅) 4 */
@Service
public class CenaServiceImpl implements CenaService {
	
	private CenasDAO cenasDAO;
	private CNAllergiesDAO CNAllergiesDAO;
	private CNDishesDAO CNDishesDAO;
	private DishesDAO dishesDAO;
	
	public void setCenasDAO(CenasDAO cenasDAO) {
		this.cenasDAO = cenasDAO;
	}
	
	public void setCNAllergiesDAO(CNAllergiesDAO cNAllergiesDAO) {
		CNAllergiesDAO = cNAllergiesDAO;
	}
	
	public void setCNDishesDAO(CNDishesDAO cNDishesDAO) {
		CNDishesDAO = cNDishesDAO;
	}
	
	public void setDishesDAO(DishesDAO dishesDAO) {
		this.dishesDAO = dishesDAO;
	}
	/*2020 08 13 김우석 작성*/
	public int uploadCena(Cena cena) {
		return cenasDAO.insert(cena);
	}
	/*2020 08 13 김우석 작성*/
	@Override
	public int uploadCnAllegies(Cena cena) {
		// TODO Auto-generated method stub
		return cenasDAO.insertcnAllegies(cena);
	}
	/*2020 08 13 김우석 작성*/
	@Override
	public int uploadCnDishes(Cena cena) {
		// TODO Auto-generated method stub
		return cenasDAO.insertCnDishes(cena);
	}
}
