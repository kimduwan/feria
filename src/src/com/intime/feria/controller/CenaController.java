package com.intime.feria.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.intime.feria.service.CenaService;
import com.intime.feria.vo.Cena;
import com.intime.feria.vo.User;

@Controller
public class CenaController {
	
	private CenaService cenaService;

	public void setCenaService(CenaService cenaService) {
		this.cenaService = cenaService;
	}
	
	/*2020 08 13 김우석*/
	@RequestMapping(value="/cenaInsert.feria",method=RequestMethod.POST)
	public String uploadCena(HttpSession session,String cenaName,
			String cenaImg,String mealType,String hostCmt
			,String cenaType,@RequestParam(value="allergy")List<String>allergy,
			@RequestParam(value="cookNo")List<String>cookNo) {
		User userSession=(User)session.getAttribute("loginUser");
		int userNo=userSession.getNo();
		System.out.println("userNo : "+userNo);
		Cena cena=new Cena(userNo, cenaImg, cenaName, hostCmt, cenaType.charAt(0), mealType.charAt(0));
		//cenas 테이블에 insert
		cenaService.uploadCena(cena);
		int cenaNo=cena.getCenaNo();
		System.out.println("cenaNo : "+cenaNo);
		//cnAllegies 테이블에 insert
		
		for(String ca:allergy) { 
			int alleNoInt=Integer.parseInt(ca); 
			System.out.println(alleNoInt);
			Cena cenaAlle=new Cena(cenaNo,alleNoInt); 
			cenaService.uploadCnAllegies(cenaAlle);
		}
				
		//cnDishes
		
		for(String cn:cookNo) { 
			int cookNoInt=Integer.parseInt(cn);
			cena.setCookNo(cookNoInt); 
			System.out.println("cookNo : "+cookNoInt);
			cenaService.uploadCnDishes(cena); 
		}
		
		return "redirect:/";
	}
}
