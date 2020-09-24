package com.intime.feria.service;

import java.util.List;
import java.util.Map;

import com.intime.feria.vo.City;
import com.intime.feria.vo.User;

/* 2020-08-07 장유정(기본세팅) */
public interface UserService {

	// 로그인
	public User login(User user);

	// 회원가입
	public int join(User user);

	public List<User> getUsers();

	public int checkEmail(String email);

	public List<City> getGugun(int cityNo);

	public List<City> getSidos();

	// 2020-08-07 박상훈 추상메서드 선언
	public int getMyFeriaTotal(int no);

	public int hideMyFeria(int prtcCntNo);

	// 2020-08-09 박상훈 추상메서드 선언
	public Map<String, Object> getMyFeriaPaginate(int page, int no);
	
	//0809 정예찬 유저 검색
	public List<User> searchUsers();
	
	//0809 정예찬 친구요청
	public int selectOne(String email);
	
	// 2020.08.10. kelly
	public Map<String, Object> getTotal(int userNo);
}
