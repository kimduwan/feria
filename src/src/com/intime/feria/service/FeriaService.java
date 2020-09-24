package com.intime.feria.service;

import java.util.List;
import java.util.Map;

import com.intime.feria.vo.Black;
import com.intime.feria.vo.CTImage;
import com.intime.feria.vo.Dish;
import com.intime.feria.vo.FDate;
import com.intime.feria.vo.FImage;
import com.intime.feria.vo.PHead;
import com.intime.feria.vo.User;

/* 2020-08-07 장유정(기본세팅) */
public interface FeriaService {

	/* 2020-08-07 노수한(진행중인 페리아 페이지) */
	public Map<String, Object> ingFeriaList(int page);

	/* 2020-08-09 오후 1시18분 노수한(진행중인 페리아 페이지 유저select) */
	public List<PHead> getUsers(int fDateNo);

	/* 2020.08.09 김우석 */
	public Map<String, Object> collectDataForFeriaDetail(int fDateNo, int userNo);

	// 2020-08-07 장유정
	public List<CTImage> getRandomCityImg(int cityNo);

	// 2020.08.11 이원희
	public int getCityNo(String cityName);

	// 2020.08.11 이원희
	public void addFeria(int cenaNo, double lat, double lng, String address, String feriaName, int maxCount,
			int minCount, char mealType, String[] feriaDate, String mealTime, String cityName, String feriaAddress,
			String detailAddress, String postcode, int userNo);

	/* 2020-08-12 김우석 추가 */
	public Map<String, Object> getDish(String cookName);

	public Map<String, Object> checkDishExist(String cookName);

	public int addCook(Dish dish);

	/* 2020 08 13 김우석 추가 */
	public Map<String, Object> checkBlackList(Black black);

	public Map<String, Object> collectDataForReservationPage(int fDateNo);

	// 2020-08-12 박상훈
	public int getHostsFeriaTotal(int no);

	public Map<String, Object> getHostsFeriaList(int page, int no);
	
	public List<FDate> getFeriaList(int pageNo, char likesType, int userNo);
	
	public Map<String, Object> getFeriaComm(int pageNo);
}
