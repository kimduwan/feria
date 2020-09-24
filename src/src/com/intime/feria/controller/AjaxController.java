package com.intime.feria.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.intime.feria.dao.SidosDAO;
import com.intime.feria.dao.SidosDAOImpl;
import com.intime.feria.service.BReplyService;
import com.intime.feria.service.BReviewService;
import com.intime.feria.service.BibeService;
import com.intime.feria.service.FReviewService;
import com.intime.feria.service.FeriaService;
import com.intime.feria.service.FriendService;
import com.intime.feria.service.LikeService;
import com.intime.feria.service.UBibeService;
import com.intime.feria.vo.Bibe;
import com.intime.feria.vo.Black;
import com.intime.feria.service.UserService;
import com.intime.feria.vo.City;
import com.intime.feria.vo.Dish;
import com.intime.feria.vo.FDate;
import com.intime.feria.vo.FImage;
import com.intime.feria.vo.FReview;
import com.intime.feria.vo.Gugun;
import com.intime.feria.vo.PageVO;
import com.intime.feria.vo.Sido;
import com.intime.feria.vo.User;

/* 2020-08-07 장유정(기본세팅) */
@RestController
public class AjaxController {

	private BReplyService bReplyService;
	private BReviewService bReviewService;
	private FReviewService fReviewService;
	private LikeService likeService;
	private UBibeService uBibeService;
	// 2020.08.07이원희
	// bibeService 추가
	private BibeService bibeService;
	private UserService userService;
	private SidosDAO sidosDAO;
	private FriendService friendService;// 0809 정예찬
	// 2020.08.13 조현득 추가
	private FeriaService feriaService;
	/* 2020 08 12 김우석 추가 */

	public void setSidosDAO(SidosDAO sidosDAO) {
		this.sidosDAO = sidosDAO;
	}

	public void setbReplyService(BReplyService bReplyService) {
		this.bReplyService = bReplyService;
	}

	public void setbReviewService(BReviewService bReviewService) {
		this.bReviewService = bReviewService;
	}

	public void setfReviewService(FReviewService fReviewService) {
		this.fReviewService = fReviewService;
	}

	public void setLikeService(LikeService likeService) {
		this.likeService = likeService;
	}

	public void setuBibeService(UBibeService uBibeService) {
		this.uBibeService = uBibeService;
	}

	// 2020.08.07 이원희
	// bibeService setter 추가
	public void setBibeService(BibeService bibeService) {
		this.bibeService = bibeService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setFriendService(FriendService friendService) {// 0809 정예찬
		this.friendService = friendService;
	}

	// 2020.08.13 조현득 추가
	public void setFeriaService(FeriaService feriaService) {
		this.feriaService = feriaService;
	}

	// 2020.08.08 이원희
	// 비베 검색 메서드
	@RequestMapping(value = "/ajax/searchBibe.feria", method = RequestMethod.GET)
	public List<Bibe> bibeSearch(@RequestParam(defaultValue = "참") String bibeName) {

		System.out.println(bibeName);

		List<Bibe> bibes = bibeService.bibeSearch(bibeName);

		return bibes;

	}

	// 2020.08.08 이원희
	// 비베 이미지 업로드 메서드
	@RequestMapping(value = "/ajax/uploadImage.feria", method = RequestMethod.POST)
	public Map<String, Object> bibeUpload(MultipartFile upload, HttpServletRequest request) throws Exception {

		System.out.println(upload);

		ServletContext application = request.getServletContext();

		String root = application.getRealPath("/");
		// System.out.println(root);

		String uploadPath = root + "upload" + File.separator;

		System.out.println(uploadPath);

		String fileName = upload.getOriginalFilename();

		UUID uuid = UUID.randomUUID();
		System.out.println(uuid);

		fileName = uuid + fileName;

		File file = new File(uploadPath + fileName);

		upload.transferTo(file);

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		map.put("src", fileName);

		return map;

	}

	// 2020.08.09 조현득
	// 회원가입 Ajax
	@RequestMapping(value = "/ajax/checkEmail.feria", method = RequestMethod.GET)
	public Map<String, Object> checkEmail(String email) {

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		int result = userService.checkEmail(email);

		map.put("count", result);

		return map;
	}

	@RequestMapping(value = "/ajax/getGugunList.feria", method = RequestMethod.GET)
	public List<City> getGugunList(int cityNo) {
		return userService.getGugun(cityNo);
	}

	@RequestMapping("/ajax/insertSidoGugun.feria")
	public void sdafsdfasf(String json) throws Exception {

		// 문자열인 json을 자바의 객체 배열로 변경
		ObjectMapper om = new ObjectMapper();

		// Sido배열 sidos는 = json의 ......
		Sido[] sidos = om.readValue(json, Sido[].class);

		for (Sido sido : sidos) {

			System.out.println("상위지역번호 : " + sido.getSidoCd() + ", 상위지역명 : " + sido.getName());

			// insert 하나
			sidosDAO.insertSido(sido);

			for (Gugun gugun : sido.getGugun()) {

				System.out.println(
						"구군 : " + gugun.getCode() + ", 도시명: " + gugun.getName() + ", 상위지역번호 : " + gugun.getSidoCd());

				gugun.setSidoCd(sido.getSidoCd());

				System.out.println(
						"구군 : " + gugun.getCode() + ", 도시명: " + gugun.getName() + ", 상위지역번호 : " + gugun.getSidoCd());
				// insert 하나

				sidosDAO.insertGugun(gugun);
			}

		}
	}

	// 0809 정예찬 유저 검색
	@RequestMapping(value = "/ajax/searchUsers.feria", method = RequestMethod.GET)
	public List<User> searchUsers() {

		return userService.searchUsers();
	}

	// 0809 정예찬 친구요청 목록
	@RequestMapping(value = "/ajax/getRequestList.feria", method = RequestMethod.GET)
	// Paging 처리를 위해 requests 목록의 페이지 번호를 얻음
	public Map<String, Object> getRequestList(@RequestParam(defaultValue = "1") String reqPage,
			HttpServletRequest request) {

		// 현재 페이지를 Int형으로 형변환
		int pageNo = Integer.valueOf(reqPage);

		// User.LOGIN(loginMember) session을 요청받아 저장
		User loginMember = (User) request.getSession().getAttribute("loginUser");

		// loginMember(로그인 한 본인)의 no를 memberNo에 저장
		int memberNo = loginMember.getNo();

		return friendService.getRequestList(pageNo, memberNo);
	}

	// 0809 정예찬 친구목록
	@RequestMapping(value = "/ajax/getFriendList.feria", method = RequestMethod.GET)
	// Paging 처리를 위해 requests 목록의 페이지 번호를 얻음
	public Map<String, Object> getFriendList(@RequestParam(defaultValue = "1") String regPage,
			HttpServletRequest request) {

		// 현재 페이지를 Int형으로 형변환
		int pageNo = Integer.valueOf(regPage);

		// User.LOGIN(loginMember) session을 요청받아 저장
		User loginMember = (User) request.getSession().getAttribute("loginUser");

		// loginMember(로그인 한 본인)의 no를 memberNo에 저장
		int memberNo = loginMember.getNo();

		return friendService.getFriendList(pageNo, memberNo);
	}

	/*
	 * 0808 김우석 작성: 페리아 상세 페이지에서 페리아 리뷰 등록할 때 후기 이미지 추가시 ajax로 이미지 파일 서버에 올려주는 컨트롤러
	 * 메서드임
	 */
	@RequestMapping(value = "/ajax/uploadFeriaReviewImg.feria", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public Map<String, Object> uploadFeriaReviewImg(HttpServletRequest request, MultipartFile feriaReviewImg)
			throws Exception {
		// 서버의 root 경로를 얻어오고 이미지를 올릴 디렉터리를 설정
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		ServletContext application = request.getServletContext();
		String rootPath = application.getRealPath("/");
		String uploadPath = rootPath + "img" + File.separator + "uploadFeriaReviewImg" + File.separator;
		System.out.println("uploadPath : " + uploadPath);

		// 파일이름 얻어오기
		String fileName = feriaReviewImg.getOriginalFilename();
		System.out.println(fileName);
		// UUID 를 랜덤으로 생성해서 파일 이름과 붙힘
		// UUID를 붙히는 이유는 파일의 이름이 중복됨을 방지하기 위해서임
		UUID uuid = UUID.randomUUID();
		fileName = uuid + fileName;
		System.out.println(fileName);

		// 파일객체 생성
		File file = new File(uploadPath + fileName);
		feriaReviewImg.transferTo(file);
		System.out.println("파일업로드 완료");

		map.put("src", "/img/uploadFeriaReviewImg/" + fileName);
		map.put("fileName", fileName);
		return map;
	}

	/*
	 * 20-08-12 조현득
	 * 
	 * @RequestMapping(value="/ajax/getBobList.feria") //스크롤 내렸을 때 받아온 페이지 번호 pageNo
	 * //하트 클릭시 받아온 게시물 타입 likesType public List<FDate> getBobList(int pageNo, char
	 * likesType, HttpSession session){
	 * 
	 * // loginMember(로그인 한 본인)의 no를 userNo에 저장 User loginMember =
	 * (User)session.getAttribute("loginMember");
	 * 
	 * 20-08-12 조현득 int userNo = 0;
	 * 
	 * if(loginMember!=null) { userNo = loginMember.getNo(); }
	 * 
	 * return feriaService.getBobList(pageNo,likesType,userNo); }
	 * 
	 * @RequestMapping(value="/ajax/getSulList.feria") public List<FDate>
	 * selectSulList(int pageNo, char likesType, HttpSession session){
	 * 
	 * // loginMember(로그인 한 본인)의 no를 userNo에 저장 User loginMember =
	 * (User)session.getAttribute("loginMember");
	 * 
	 * 20-08-12 조현득 int userNo = 0;
	 * 
	 * if(loginMember!=null) { userNo = loginMember.getNo(); }
	 * 
	 * return feriaService.getSulList(pageNo,likesType,userNo); }
	 */

	// 2020-08-12 이원희 메서드 선언
	@RequestMapping(value = "/ajax/bibeList.feria", method = RequestMethod.GET)
	public List<Bibe> getBibeList(Bibe bibe, HttpSession session) {

		// USER vo객체를 가진 변수 user에 session에 있는 User.LOGIN로 초기화
		User user = (User) session.getAttribute("loginUser");

		// int형 no 변수는 User vo의 no로 초기화
		int no = user.getNo();

		System.out.println(bibe.getVal());

		// Bibe객체의 멤버필드 no를 유저 고유 번호로 세팅
		bibe.setUserNo(no);

		// bibeService.메서드 리턴
		return bibeService.getHostsBibeList(bibe);
	}

	// 2020-08-13 박상훈
	@RequestMapping(value = "/ajax/reviewsList.feria", method = RequestMethod.GET)
	public List<FReview> getHostsReviewsList(HttpSession session, char likeType) {

		// 로그인 유저를 얻어와서 User 객체에 담아줌
		User user = (User) session.getAttribute("loginUser");

		// userNo는 로그인한 유저번호
		int userNo = user.getNo();

		// FReview 객체를 배열로 가진 지역변수 선언
		List<FReview> fReviews = fReviewService.getHostsReviews(userNo);

		// FReview 객체에 하나씩 담는다
		for (FReview fReview : fReviews) {
			fReview.setbReviews(bReviewService.getHostsBreviews(fReview.getFrNo()));
		} // for end

		return fReviews;
	}

	/* 2020 08 13 김우석 작성 */
	@RequestMapping(value = "/ajax/addBlackList.feria", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public Map<String, Object> addBlackList(Black black, HttpSession session) {
		User userSession = (User) session.getAttribute("loginUser");
		int userNo = userSession.getNo();
		black.setUserNo(userNo);
		Map<String, Object> map = feriaService.checkBlackList(black);
		return map;
	}
	/* 2020 08 12 김우석 작성 */

	@RequestMapping(value = "ajax/searchDishes.feria", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public Map<String, Object> searchDishes(@RequestParam(value = "cookName") String cookName) {
		// System.out.println(cookName);
		// dish테이블에서
		// cookName 에 해당되는 요리를 불러서
		// Dish 객체를 map 에 넣어준뒤
		// 반환
		// cena_insert.jsp 에서 요리테그
		Map<String, Object> map = feriaService.getDish(cookName);
		List<Dish> dishes = (List<Dish>) map.get("cook");
		if (dishes != null) {
			for (Dish dish : dishes) {
				System.out.println(dish.getCookName());
			}
		}
		return map;
	}

	// 0811 정예찬 페리아 리스트
	@RequestMapping(value = "/ajax/getFeriaList.feria")
	// 스크롤 내렸을 때 받아온 페이지 번호 pageNo
	public List<FDate> getFeriaList(int pageNo, char likesType, HttpSession session) {

		// loginMember(로그인 한 본인)의 no를 userNo에 저장
		User loginMember = (User) session.getAttribute("loginMember");
		int userNo = loginMember.getNo();

		return feriaService.getFeriaList(pageNo, likesType, userNo);
	}

	// 08.13 bibe 출력 이원희
	@RequestMapping(value = "/ajax/getSulList.feria", method = RequestMethod.GET)
	public List<Bibe> getBibeList(@RequestParam(defaultValue = "1") int page) {
		return bibeService.getBibeComm(page);
	}
	
	@RequestMapping(value = "/ajax/getFeriaComm.feria", method = RequestMethod.GET)
	public Map<String, Object> getFeriaComm(@RequestParam(defaultValue = "1")int pageNo){
		
		return feriaService.getFeriaComm(pageNo);
		
	}
	
}
