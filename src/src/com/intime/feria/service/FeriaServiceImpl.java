package com.intime.feria.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.intime.feria.dao.CTImagesDAO;
import com.intime.feria.dao.CitiesDAO;
import com.intime.feria.dao.DishesDAO;
import com.intime.feria.dao.FDatesDAO;
import com.intime.feria.dao.FImagesDAO;
import com.intime.feria.dao.FParticipationsDAO;
import com.intime.feria.dao.FReviewsDAO;
import com.intime.feria.dao.FeriasDAO;
import com.intime.feria.dao.LikesDAO;
import com.intime.feria.dao.PHeadsDAO;
import com.intime.feria.util.PaginateUtil;
import com.intime.feria.vo.Black;
import com.intime.feria.vo.CTImage;
import com.intime.feria.vo.Dish;
import com.intime.feria.vo.FDate;
import com.intime.feria.vo.FImage;
import com.intime.feria.vo.Feria;
import com.intime.feria.vo.Like;
import com.intime.feria.vo.PHead;
import com.intime.feria.vo.PageVO;
import com.intime.feria.vo.User;

/* 2020-08-07 장유정(기본세팅) 5 */
@Service
public class FeriaServiceImpl implements FeriaService {

	private FDatesDAO fDatesDAO;
	private FeriasDAO feriasDAO;
	private FImagesDAO fImagesDAO;
	private FParticipationsDAO fParticipationsDAO;
	private PHeadsDAO pHeadsDAO;
	// 2020.08.11 이원희
	private CitiesDAO citiesDAO;
	// 2020.08.11 이원희
	private LikesDAO likesDAO;

	/* 2020-08-07 장유정 */
	/* ================================ setter ================================ */
	private CTImagesDAO ctImagesDAO;
	// 김우석 2020.08.14
	private DishesDAO dishesDAO;

	public void setfDatesDAO(FDatesDAO fDatesDAO) {
		this.fDatesDAO = fDatesDAO;
	}

	public void setFeriasDAO(FeriasDAO feriasDAO) {
		this.feriasDAO = feriasDAO;
	}

	public void setfImagesDAO(FImagesDAO fImagesDAO) {
		this.fImagesDAO = fImagesDAO;
	}

	public void setfParticipationsDAO(FParticipationsDAO fParticipationsDAO) {
		this.fParticipationsDAO = fParticipationsDAO;
	}

	public void setpHeadsDAO(PHeadsDAO pHeadsDAO) {
		this.pHeadsDAO = pHeadsDAO;
	}

	public void setCtImagesDAO(CTImagesDAO ctImagesDAO) {
		this.ctImagesDAO = ctImagesDAO;
	}

	// 2020.08.11 이원희
	public void setCitiesDAO(CitiesDAO citiesDAO) {
		this.citiesDAO = citiesDAO;
	}

	// 2020.08.14 김우석 dishesDAO 세터
	public void setDishesDAO(DishesDAO dishesDAO) {
		this.dishesDAO = dishesDAO;
	}

	// 2020.08.11 이원희 likesDAO setter
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}

	@Override
	public Map<String, Object> ingFeriaList(int page) {
		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();

		int numPage = 4;
		PageVO pageVO = new PageVO(page, numPage);

		List<Feria> feriasLists = feriasDAO.selectListByFeria(pageVO);

		for (Feria feria : feriasLists) {
			System.out.println(feria.getFeriaDate());
		}

		int total = feriasDAO.selectTotal();

		String paginate = PaginateUtil.getPaginate(page, total, numPage, 3, "/host_progressingFeriaList.feria",
				"page=");

		modelMap.put("feriaLists", feriasLists);
		modelMap.put("paginate", paginate);

		return modelMap;
	} /* ingFeriaList() end 2020-08-07 오전 12시 노수한 */

	@Override
	public List<PHead> getUsers(int fDateNo) {
		// TODO Auto-generated method stubx
		return feriasDAO.selectByProfileList(fDateNo);
	}

	/* 2020-08-08 김우석 작성 */
	/* feria_detail.jsp 전용 메서드 */
	public Map<String, Object> collectDataForFeriaDetail(int fDateNo, int userNo) {
		// 반환되어질 map
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		// 페리아 기본정보들 가져오기 (페리아 이름, 페리아 개최날짜)

		// 현재날짜 가져오기
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		int date = calendar.get(Calendar.DATE);

		System.out.println("현재날짜 : " + year + "년" + month + "월" + date + "일");

		// feria 진행 날짜
		FDate fDateInfo = fDatesDAO.selectOne(fDateNo);

		Calendar fDay = Calendar.getInstance();
		fDay.setTime(fDateInfo.getFeriaDate());

		// 페리아 개최날짜를 밀리세컨드로 변환후 얻어옴
		long fDayMills = fDay.getTimeInMillis();
		long toDayMills = calendar.getTimeInMillis();
		// 페리아 날짜 전후로 들어가지는 페이지가 달라지게 하기 위해..

		long timeDiff = fDayMills - toDayMills;
		System.out.println("timeDiff : " + timeDiff);
		// 페리아 종료 여부
		boolean isAfterFeria = true;
		if (timeDiff <= 0) {
			// 페리아 종료후의 페리아 상세 페이지:
			// feria_detail.jsp 전용 데이터들
			map.put("fDateInfo", fDateInfo);
			System.out.println("feriaName : " + fDateInfo.getFeriaName());
			System.out.println("feriaDate : " + fDateInfo.getFeriaDate());

			// 페리아 리뷰 이미지들 가져오기
			List<FDate> fDateImg = fDatesDAO.selectFdateImg(fDateNo);
			if (fDateImg != null) {
				map.put("fDateImg", fDateImg);
				for (FDate fImg : fDateImg) {
					System.out.println(fImg.getfImg());
				}
			}

			// 페리아 비베들 가져오기
			List<FDate> bibes = fDatesDAO.selectBibeList(fDateNo);
			if (bibes != null) {
				map.put("bibes", bibes);
				for (FDate bibe : bibes) {
					System.out.println(bibe.getBibeName());
					System.out.println(bibe.getBibeImg());
				}
			}
			if (userNo != 0) {
				// 페리아 참여자 block 가능한지 여부
				int isHost = fDatesDAO.selectHost(fDateNo);
				FDate fDate = new FDate(fDateNo, userNo);
				int isGuest = fDatesDAO.selectOkToReview(fDate);
				int flag = 0;
				if (isHost == userNo || isGuest > 0) {
					flag = 1;
				}
				map.put("flag", flag);
				System.out.println("flag : " + flag);
			}
			isAfterFeria = true;

		} else {
			isAfterFeria = false;
		}
		map.put("isAfterFeria", isAfterFeria);
		return map;
	}

	/* 2020-08-09 장유정 */
	/*
	 * ================================ abstract method
	 * ================================
	 */

	@Override
	public List<CTImage> getRandomCityImg(int cityNo) {
		return ctImagesDAO.selectRandomCityImg(cityNo);
	}

	// 2020.08.11 이원희
	@Override
	public int getCityNo(String cityName) {
		// TODO Auto-generated method stub
		return citiesDAO.selectCityNo(cityName);
	}

	public void addFeria(int cenaNo, double lat, double lng, String address, String feriaName, int maxCount,
			int minCount, char mealType, String[] feriaDate, String mealTime, String cityName, String feriaAddress,
			String detailAddress, String postcode, int userNo) {

		System.out.println("페리아 제목 : " + feriaName);
		System.out.println("우편번호 : " + postcode);
		System.out.println("페리아 주소 : " + feriaAddress);
		System.out.println("페리아 상세주소 : " + detailAddress);
		System.out.println("위도 : " + lat);
		System.out.println("경도 : " + lng);
		System.out.println("최소인원 : " + minCount);
		System.out.println("최대인원 : " + maxCount);
		System.out.println("밥타입 : " + mealType);
		System.out.println("밥시간 : " + mealTime);
		System.out.println("유저번호 : " + userNo);
		System.out.println("세나번호 : " + cenaNo);
		int cityNo = citiesDAO.selectCityNo(cityName);
		System.out.println("지역번호 : " + cityNo);

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

		// FERIA insert
		Feria feria = new Feria(feriaName, postcode, feriaAddress, detailAddress, lat, lng, minCount, maxCount,
				mealType, mealTime, userNo, cenaNo, cityNo);

		feriasDAO.insert(feria);

		int feriaNo = feria.getFeriaNo();
		System.out.println();

		for (int i = 0; i < feriaDate.length; i++) {
			System.out.println("페리아 날짜 : " + feriaDate[i]);
			String year = feriaDate[i].substring(0, 4);
			String month = feriaDate[i].substring(5, 7);
			String day = feriaDate[i].substring(feriaDate[i].length() - 2, feriaDate[i].length());
			System.out.println(year + "-" + month + "-" + day);
			Date feriaDaten = Date.valueOf(year + "-" + month + "-" + day);
			FDate fDate = new FDate(feriaNo, feriaDaten);

			fDatesDAO.insert(fDate);
		}

	}

	/* 2020 8 12 김우석 추가 */
	@Override
	public Map<String, Object> collectDataForReservationPage(int fDateNo) {
		// 페리아 개최되기 전의 페리아 상세 페이지:reservation_page.jsp 전용 데이터들
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		List<FDate> bibes = fDatesDAO.selectBibeDetailList(fDateNo);
		FDate fDateInfoDetail = fDatesDAO.selectOneDetail(fDateNo);

		map.put("fDateInfo", fDateInfoDetail);
		map.put("bibes", bibes);

		return map;
	}

	/* 2020 8 12 김우석 추가 */
	@Override
	public Map<String, Object> getDish(String cookName) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		List<Dish> dish = dishesDAO.selectDishCheck(cookName);
		if (dish != null) {
			map.put("cook", dish);
		}
		return map;
	}

	/* 2020 8 12 김우석 추가 */
	@Override
	public Map<String, Object> checkDishExist(String cookName) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		Dish dish = dishesDAO.selectDishNoCheck(cookName);
		if (dish != null) {
			map.put("cook", dish);
		}
		return map;
	}

	/* 2020 8 12 김우석 추가 */
	@Override
	public int addCook(Dish dish) {
		// TODO Auto-generated method stub
		return dishesDAO.insert(dish);
	}

	/* 2020 08 13 김우석 추가 */
	@Override
	public Map<String, Object> checkBlackList(Black black) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		int isAddedBlackList = fDatesDAO.selectAddBlackList(black);
		if (isAddedBlackList >= 1) {
			map.put("msg", "이미 신고처리 되었습니다");
		} else {
			int num = fDatesDAO.insertBlackList(black);
			map.put("msg", "신고처리 완료 되었습니다");
		}
		return map;
	}

	// 2020-08-12 이원희
		@Override
		public Map<String, Object> getHostsFeriaList(int page, int no) {

			// 개최한 페리아, 페이지 네이트 넘어감
			Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();
			System.out.println("유저번호는? :" + no);

			// 한 페이지에 보여질 페이라 수
			int numPage = 8;

			// 페이지 네이션 블록 수
			int numBlock = 3;

			PageVO pageVO = new PageVO(page, numPage, no);
			List<Feria> ferias = feriasDAO.selectHostsFeiraList(pageVO);

			int total = feriasDAO.selectHostsFeriaTotal(no);

			String paginate = PaginateUtil.getPaginate(page, total, numPage, numBlock, "/hostsPastFeria.feria", "page=");

			// 잘나오나 출력 확인
			// for (Feria feria : ferias) {
			// System.out.println("제목"+feria.getFeriaName());
			// System.out.println("시간"+feria.getFeriaDate());
			// System.out.println("시간형변환"+feria.getFeriaDateChange());
			// }//에러도 발생 안 하고, 출력 조차도 안 됨
			// -> 그것은 바로.. new PageVO(page, numPage) 만 되어있었음...

			modelMap.put("ferias", ferias);
			modelMap.put("paginate", paginate);
			modelMap.put("total", total);

			return modelMap;
		}

	@Override
	public int getHostsFeriaTotal(int no) {
		return feriasDAO.selectHostsFeriaTotal(no);
	}

	// 0811 정예찬 페리아 리스트
	@Override
	public List<FDate> getFeriaList(int pageNo, char likesType, int userNo) {

		// 한 페이지에 보여지는 게시물수
		int numPage = 6;

		PageVO pageVO = new PageVO(pageNo, numPage);

		List<FDate> fDates = fDatesDAO.selectList(pageVO);

		for (FDate fDate : fDates) {

			int fDateNo = fDate.getfDateNo();
			fDate.setfImages(fImagesDAO.selectList(fDateNo));
			fDate.setpHeads(pHeadsDAO.selectList(fDateNo));

			Like like = new Like(likesType, fDateNo, userNo);
			int searchLike = likesDAO.selectUserLike(like);
			fDate.setFeriaFlag(searchLike != 0);

			// likes테이블에서 게시물 타입과 게시물 번호로 라이크 갯수 카운트
			Like count = new Like(likesType, fDateNo);
			int likeCount = likesDAO.selectLikeCount(count);

			// vo.FDate의 멤버필드에 라이크 갯수 세팅
			fDate.setLikeCount(likeCount);
		}
		return fDates;
	}
	
	@Override
	public Map<String, Object> getFeriaComm(int pageNo) {
		
		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();
		
		int numPage = 6;
		
		PageVO pageVO = new PageVO(pageNo, numPage);
		
		int numBlock = 10;
		
		int total = fDatesDAO.selectFeriaCommTotal();
		
		String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, "/", "page=");
		
		List<FImage> fimage = fImagesDAO.selectFeriaComm(pageVO);
		
		modelMap.put("fimage", fimage);
		modelMap.put("paginate", paginate);
		
		return modelMap;
	}
}
