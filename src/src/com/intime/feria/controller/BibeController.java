package com.intime.feria.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.intime.feria.service.BReplyService;
import com.intime.feria.service.BReviewService;
import com.intime.feria.service.BibeService;
import com.intime.feria.service.UBibeService;
import com.intime.feria.vo.BDetail;
import com.intime.feria.vo.BIngredient;
import com.intime.feria.vo.BMlPrice;
import com.intime.feria.vo.Bibe;
import com.intime.feria.vo.User;

@Controller
public class BibeController {
	
/* 2020-08-07 박상훈 기본세팅 */
	
	//멤버필드
	
	private BibeService bibeService;
	private BReviewService bReviewService;
	private BReplyService bReplyService;
	private UBibeService uBibeService;
	
	public void setBibeService(BibeService bibeService) {
		this.bibeService = bibeService;
	}
	public void setbReviewService(BReviewService bReviewService) {
		this.bReviewService = bReviewService;
	}
	public void setbReplyService(BReplyService bReplyService) {
		this.bReplyService = bReplyService;
	}
	public void setuBibeService(UBibeService uBibeService) {
		this.uBibeService = uBibeService;
	}
	
	//2020.08.07 이원희
	//bibe_resist 맵핑
	@RequestMapping(value = "/bibeResistForm.feria", method = RequestMethod.GET)
	public String bibeResistForm() {
		
		return "bibe_resist";
	}
	
	
	
	
	//2020.08.09 이원희
	//bibe insert 메서드
	@RequestMapping(value = "/bibeResist.feria", method = RequestMethod.POST)
	public String bibeAdd(Bibe bibe,@RequestParam(required = false) int[] bibeMl,
			@RequestParam(required = false) int[] bibeIng,
			@RequestParam(required = false) int[] bibePrice,@RequestParam(required = false) int[] ingRatio,HttpSession session,String bibeBrand,@RequestParam(defaultValue = "0")double bibeAvb) {
	
		//User user = (User)session.getAttribute("loginMember");
		
		System.out.println("bibeName: "+bibe.getBibeName());
		System.out.println("bibeType: "+bibe.getbTypeNo());
		System.out.println("bibeImg: "+bibe.getBibeImg());
		System.out.println("bibeDetail: "+bibe.getBibeDetail());
		//System.out.println("user: "+user.getNo());
		System.out.println("bibeMl: "+bibeMl.length);
		System.out.println("bibePrice: "+bibePrice.length);
		System.out.println("ingRatio: "+ingRatio.length);
		System.out.println("bibeIng: "+bibeIng.length);
		System.out.println("bibeAvb: "+bibeAvb);
		System.out.println("bibeBrand: "+bibeBrand);
		
		//Bibe newBibe = new Bibe(bibe.getbTypeNo(), 1, bibe.getBibeName(), bibe.getBibeImg(), bibe.getBibeDetail());
		
		//bibeService.addBibe(bibe, bibeAvb,bibeBrand, bibeMl, bibePrice, session,ingRatio,bibeIng);
		bibeService.addBibe(bibe, bibeBrand, bibeAvb, bibeMl, bibePrice, session, ingRatio, bibeIng);
		
		return "redirect:/bibeDetail.feria";
	}
	
	@RequestMapping(value = "/feria_bibe_communityList.feria", method = RequestMethod.GET)
	public String getBibeList() {
		
		
		return "feria_bibe_community";
	}//getBibeLists() end 08-08 오전 12시 17분 노수한

	
	
	@RequestMapping(value = "/ajax/feria_bibe_communityLists.feria", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getBibeLists(@RequestParam(defaultValue = "1")int page) {
		
		
		return bibeService.getBibeLists(page);
	}//getBibeLists() end 08-08 오전 12시 17분 노수한
	
}
