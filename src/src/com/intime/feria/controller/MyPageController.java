package com.intime.feria.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.intime.feria.service.BibeService;
import com.intime.feria.service.BlackListService;
import com.intime.feria.service.FReviewService;
import com.intime.feria.service.FeriaService;
import com.intime.feria.service.FriendService;
import com.intime.feria.service.PHeadService;
import com.intime.feria.service.UserService;
import com.intime.feria.vo.PHead;
import com.intime.feria.vo.User;

@Controller
public class MyPageController {

	private BlackListService blackListService;
	private FriendService friendsService;
	private BibeService bibeService;
	private PHeadService pHeadService;
	// 2020-08-07 박상훈 userService 멤버필드
	private UserService userService;
	private FReviewService fReviewService;
	private FeriaService feriaService;
	
	public void setfReviewService(FReviewService fReviewService) {
		this.fReviewService = fReviewService;
	}

	public void setBlackListService(BlackListService blackListService) {
		this.blackListService = blackListService;
	}

	public void setFriendsService(FriendService friendsService) {
		this.friendsService = friendsService;
	}
	
	public void setBibeService(BibeService bibeService) {
		this.bibeService = bibeService;
	}
	
	public void setpHeadService(PHeadService pHeadService) {
		this.pHeadService = pHeadService;
	}
	// 2020-08-07 박상훈 userService 세터
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setFeriaService(FeriaService feriaService) {
		this.feriaService = feriaService;
	}

	// 2020-08-09 박상훈 ReservedFeira 메서드
	@RequestMapping(value = "/ReservedFeira.feria", method = RequestMethod.GET)
	public String ReservedFeira(Model model, @RequestParam(defaultValue = "1") int page, HttpSession session) {
		System.out.println("페이지번호 : " + page);

		// F) HttpSession을 인자로 선언
		// User 객체를 loginMember라는 변수로 선언
		// 메서드 호출 후 User로 형변환
		//User loginMember = (User) session.getAttribute("loginUser");

		// attribute등록
		// F-2) 로그인멤버 인자 추가 선언
		model.addAllAttributes(userService.getMyFeriaPaginate(page, 51));
		//1번유저: 호스트: 
		//51번유저: 게스트:
		//
		// 리턴
		return "myPageReservedFeria";
	}

	// 0809 정예찬 친구관리 페이지
	@RequestMapping(value = "/friend_management.feria", method = RequestMethod.GET)
	public void friendManagement() {

	}

	// 0809 정예찬 친구요청 리다이렉트뷰
	@RequestMapping(value = "/request.feria", method = RequestMethod.POST)
	// name="email" 로 넘긴 email parameter 값 저장
	public void request(String email, PrintWriter out, HttpServletRequest req, HttpServletResponse resp) {

		friendsService.request(email, out, req, resp);
	}

	
	
	
	
	/* 2020.08.07. Kelly */
	@RequestMapping(value = "/bibe_list.feria", method = RequestMethod.GET)
	public void bibeList(Model model, HttpSession session){
		
		//유저 세션을 얻어옴
		//User loginUser = (User)session.getAttribute("loginUser");
		
		//bibes를 모델에 등록
		model.addAttribute("bibes", bibeService.getLikeBibe(52));
		
	}
	
	/* 2020.08.09. Kelly */
	@RequestMapping(value="/guest_participatedFeria.feria", method = RequestMethod.GET)
	public void guest_participatedFeria(Model model,HttpSession session  ) {
		
		//User loginUser = (User)session.getAttribute("loginUser");
		
		model.addAttribute("feriaList", pHeadService.getUserPHeads(52));
	}
	
	/*2020.08.10. Kelly*/
	@RequestMapping(value="/mypageHeader.feria",method=RequestMethod.GET)
	public void mypageHeader(Model model,HttpSession session) {
		
		//User loginUser = (User)session.getAttribute("loginUser");
		
		model.addAllAttributes(userService.getTotal(52));
	
	}
	
		
		//2020-08-12 박상훈 : 호스트의 지난 페리아 페이지
		@RequestMapping(value = "/hostsPastFeria.feria", method = RequestMethod.GET)
		public String HostsPastFeria(Model model, @RequestParam(defaultValue = "1") int page, HttpSession session) {
			
			//로그인 유저 받아옴
			User loginUser = (User)session.getAttribute("loginUser");
			//System.out.println(loginUser.getNo());
			//지난페리아 얻어오는 메서드u
			model.addAllAttributes(feriaService.getHostsFeriaList(page, loginUser.getNo()));

			//페리아 리뷰 개수 얻어오는 메서드
			int numReview = fReviewService.getHostsReviewTotal(loginUser.getNo());
			
			model.addAttribute("numReview",numReview);
			
			
			return "host_lastFeria";
		}
}
