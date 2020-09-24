package com.intime.feria.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.intime.feria.dao.CitiesDAO;
import com.intime.feria.dao.UsersDAO;
import com.intime.feria.util.PaginateUtil;
import com.intime.feria.vo.City;
import com.intime.feria.vo.PageVO;
import com.intime.feria.vo.User;

/* 2020-08-07 장유정(기본세팅) 1 */
@Service
public class UserServiceImpl implements UserService {

	private UsersDAO usersDAO;
	private CitiesDAO citiesDAO;

	public void setCitiesDAO(CitiesDAO citiesDAO) {
		this.citiesDAO = citiesDAO;
	}

	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}

	@Override
	public User login(User user) {

		return usersDAO.selectLogin(user);
	}

	@Override
	public int join(User user) {
		return usersDAO.insert(user);
	}

	@Override
	public List<User> getUsers() {
		return usersDAO.selectUserList();
	}

	@Override
	public int checkEmail(String email) {
		return usersDAO.selectCheckEmail(email);
	}

	@Override
	public List<City> getGugun(int cityNo) {
		return citiesDAO.selectGugun(cityNo);
	}

	@Override
	public List<City> getSidos() {
		return citiesDAO.selectSi();
	}

	// 2020-08-09 박상훈 추상메서드 구현
	@Override
	public Map<String, Object> getMyFeriaPaginate(int page, int no) {

		// 리턴자료형과 동일한 지역변수 선언 및 초기화
		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();

		// 한 페이지당 보여질 페리아 수
		int numPage = 8;

		// NullPointException 발생으로 no확인해보기
		// mapper selectTotal resultType을 User로 해서 그럼 COUNT는 반드시 int
		System.out.println("no:" + no);

		// PageVO 객체를 가진 변수 선언 및 초기화
		PageVO pageVO = new PageVO(page, numPage, no);

		// User 객체를 배열로 가진 List컬렉션을 변수로 선언 후 usersDAO의 메서드로 초기화
		List<User> userFeiras = usersDAO.selectMypageFeriaList(pageVO);

		// Final) 에러가 발생해서 값이 안들어가나 확인
		// 결과 값 true 발생 -> 메서드에 인자 no 선언 후 -> Controller의 이동
		System.out.println("userFeiras:" + userFeiras.isEmpty());

		// 페이지네이트의 블록 수
		int numBlock = 3;

		// 전체 게시물 수
		int total = usersDAO.selectTotal(no);

		// 페이지 네이션 변수 선언
		String paginate = PaginateUtil.getPaginate(page, total, numPage, numBlock, "/ReservedFeira.feria", "page=");

		// for문을 이용하여 확인
		for (User user : userFeiras) {
			System.out.println(user.getFeriaName());
		}

		// 리턴
		modelMap.put("userFeiras", userFeiras);
		modelMap.put("paginate", paginate);
		modelMap.put("total", total);
		return modelMap;
	}

	// 2020-08-07 박상훈 추상메서드 구현
	@Override
	public int getMyFeriaTotal(int no) {
		return usersDAO.selectTotal(no);
	}

	@Override
	public int hideMyFeria(int prtcCntNo) {
		return usersDAO.updateMypageFeriaPrivate(prtcCntNo);
	}

	// 0809 정예찬 유저 검색
	@Override
	public List<User> searchUsers() {
		return usersDAO.selectUserList();
	}

	// 0809 정예찬 친구요청
	@Override
	public int selectOne(String email) {
		return usersDAO.selectOne(email);
	}
	
	@Override
	public Map<String, Object> getTotal(int userNo) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("inviteTotal",usersDAO.selectTotalInvite(userNo));
		map.put("invitedTotal",usersDAO.selectTotalInvited(userNo));
		
		return map;
	}

}
