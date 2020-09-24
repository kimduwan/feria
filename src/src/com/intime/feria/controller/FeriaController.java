package com.intime.feria.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.intime.feria.service.FReviewService;
import com.intime.feria.service.FeriaService;
import com.intime.feria.service.FriendService;
import com.intime.feria.vo.BReview;
import com.intime.feria.vo.FImage;
import com.intime.feria.vo.FReview;
import com.intime.feria.vo.PHead;
import com.intime.feria.vo.User;

@Controller
public class FeriaController {

	private FeriaService feriaService;
	/* 2020-08-09 장유정 */
	private FriendService friendService;
	private FReviewService fReviewService;
	
	//2020 08 10 김우석 추가
			public void setfReviewService(FReviewService fReviewService) {
				this.fReviewService = fReviewService;
			}
			
			public void setFeriaService(FeriaService feriaService) {
				this.feriaService = feriaService;
			}


	public void setFriendService(FriendService friendService) {
		this.friendService = friendService;
	}

	
	@RequestMapping(value = "/feriaOpenForm.feria", method = RequestMethod.GET)
	public String feriaOpen() {

		return "feria_open";
	}

	@RequestMapping(value = "/host_progressingFeriaList.feria", method = RequestMethod.GET)
	public String ingFeriaList(Model model, @RequestParam(defaultValue = "1") int page) {

		model.addAllAttributes(feriaService.ingFeriaList(page));
		return "host_progressingFeria";

	}// ingFeriaList() end 08-08 오전 12시 17분 노수한

	@RequestMapping(value = "/host_progressingFeriaUserList.feria", method = RequestMethod.GET)
	public void getUsers(Model model, @RequestParam(defaultValue = "1") int fDateNo) {

		List<PHead> userLists = feriaService.getUsers(fDateNo);
		model.addAttribute("userLists", userLists);

	}// getUsers() end 08-09 오전 1시 25분 노수한

	/*김우석 2020-08-08 작성*/
	@RequestMapping(value="/feria_detail.feria",method=RequestMethod.GET)
	public String feriaDetail(Model model,@RequestParam(defaultValue="1")int fDateNo,
			HttpSession session) {
		User userSession=(User)session.getAttribute("loginUser");
		int userNo=-1;
		try {
			userNo=userSession.getNo();
		}catch (Exception e) {
			userNo=0;
		}
		Map<String, Object>map=feriaService.collectDataForFeriaDetail(fDateNo, userNo);
		boolean isAfterFeria=(boolean)map.get("isAfterFeria");
		if(!isAfterFeria) {return reservationPage(model,fDateNo);}
		map.remove("isAfterFeria");
		model.addAllAttributes(map);
		return "feria_detail";
	}

	/*2020 08 10 김우석 수정*/
	@RequestMapping(value="/uploadReviews.feria", method=RequestMethod.POST)
	public String uploadReview(Model model,HttpSession session,@RequestHeader String referer,
			@RequestParam String frText,int fDateNo,
			String[] fImg,int[] bibeNo,@RequestParam(value="brSw", required=true)List<String>brSw,
			@RequestParam(value="brBd", required=true)List<String>brBd,
			@RequestParam(value="brTs",required=true)List<String>brTs,int brStar[])throws Exception {
		//f_reviews 테이블에 입력할 data들
		System.out.println("frText : "+frText);
		System.out.println("frfDateNo : "+fDateNo);
		System.out.println("fImgLength : "+fImg.length);
		User user=(User)session.getAttribute("loginUser");
		int userNo=user.getNo();
		
		//f_review 테이블에 입력
		FReview fReview=new FReview(userNo, fDateNo, frText);
		int no=fReviewService.uploadFReview(fReview);
		int frNo=fReview.getFrNo();
		System.out.println("frNo : "+frNo);
		
		//f_images 테이블에 입력할 data들
		
		System.out.println("bibeNo : "+bibeNo);
		//f_images 테이블에 입력
		for(int i=0;i<fImg.length;i++) {
			if(!fImg[i].equals("")) {
				System.out.println(fImg[i]);
				FImage fImage=new FImage(frNo, fDateNo, fImg[i]);
				fReviewService.uploadFImage(fImage);
			}
		}
		//b_reviews 테이블에 입력
		for(int i=0;i<brSw.size();i++) {
			BReview bReview
			= new BReview(brSw.get(i).charAt(0),
					brTs.get(i).charAt(0), 
					brBd.get(i).charAt(0), 
					brStar[i], userNo, bibeNo[i], frNo);
			fReviewService.uploadBibeReview(bReview);
		}
		
		//비베 리뷰에 등록할 data들
		System.out.println("brSw Length : "+brSw.size());
		for(int i=0;i<brSw.size();i++) {System.out.println(brSw.get(i));}
		
		System.out.println("brBd Length : "+brBd.size());
		for(int i=0;i<brBd.size();i++) {System.out.println(brSw.get(i));}
		
		System.out.println("brTs Length : "+brTs.size());
		for(int i=0;i<brTs.size();i++) {System.out.println(brSw.get(i));}
		
		System.out.println("brStar");
		for(int i=0;i<brStar.length;i++) {System.out.println(brStar[i]);}
		
		System.out.println("referer : "+referer);
		return "redirect:"+referer;
	}

	/* 2020-08-09 장유정 */
	@RequestMapping(value = "/feria_participate.feria", method = RequestMethod.GET)
	public void feriaPartiForm(Model model, HttpSession session) {

		User user = (User) session.getAttribute("loginUser");

		model.addAttribute("friends", friendService.prtcFriendList(user.getNo()));
	}

	/* 2020-08-09 장유정 */
	@RequestMapping(value = "/gotoSelectLocation.feria", method = RequestMethod.POST)
	public void feriaLocation(Model model, int cityImgNo) {

	}

	/*2020-08-11 이원희*/
	@RequestMapping(value = "/feriaOpen.feria",method = RequestMethod.GET)
	public void feriaAddForm(int cenaNo,Model model) {
		model.addAttribute("cenaNo", cenaNo);
	}
	
	/*2020-08-11 이원희*/
	@RequestMapping(value = "/addFeria.feria", method = RequestMethod.POST)
	public String feiraAdd(int cenaNo,double lat,double lng,String address,String feriaName,String cityNo,int maxCount,int minCount,
			char mealType,String[] feriaDate,String feriaHour,String feriaAddress,String detailAddress,String postcode,
			HttpSession session) {
		User user = (User)session.getAttribute("loginUser");
		int userNo = user.getNo();
		System.out.println(lat);
		System.out.println(lng);
		System.out.println(cenaNo);
		System.out.println(feriaName);
		System.out.println(cityNo);
		System.out.println(maxCount);
		System.out.println(minCount);
		String mealTime = feriaHour.substring(0, 2)+feriaHour.subSequence(feriaHour.length()-2, feriaHour.length());
		

		
		for (int i = 0; i < feriaDate.length; i++) {
			System.out.println(feriaDate[i]);
		}
		System.out.println(feriaAddress);
		System.out.println(detailAddress);
		
		feriaService.addFeria(cenaNo,lat,lng,address,feriaName,
				maxCount,minCount,mealType,feriaDate,mealTime,cityNo,feriaAddress,detailAddress,postcode,userNo);
		
		return "redirect:/feriaOpen.feria?cenaNo=1";
	}
	
	
		
		/*김우석 2020 08 12 작성*/
		
		@RequestMapping(value="/cena_insert.feria", method=RequestMethod.GET )
		public String CenaInsert(HttpSession session) {
			
			return "cena_insert";
		}
		
		/*김우석 2020 08 11 작성*/
		@RequestMapping(value="/reservation_page.feria",method=RequestMethod.GET)
		public String reservationPage(Model model,int fDateNo) {
			Map<String,Object>map=feriaService.collectDataForReservationPage(fDateNo);
			model.addAllAttributes(map);
			return "reservation_page";
		}
}
