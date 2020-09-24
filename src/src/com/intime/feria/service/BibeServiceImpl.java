package com.intime.feria.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.intime.feria.dao.BDetailsDAO;
import com.intime.feria.dao.BIngredientsDAO;
import com.intime.feria.dao.BMlPricesDAO;
import com.intime.feria.dao.BTypesDAO;
import com.intime.feria.dao.BibesDAO;
import com.intime.feria.dao.UsersDAO;
import com.intime.feria.util.PaginateUtil;
import com.intime.feria.vo.BDetail;
import com.intime.feria.vo.BIngredient;
import com.intime.feria.vo.BMlPrice;
import com.intime.feria.vo.Bibe;
import com.intime.feria.vo.PageVO;
import com.intime.feria.vo.User;

@Service
public class BibeServiceImpl implements BibeService {

	/* 2020-08-07 박상훈 기본세팅 */

	// 멤버필드 bibesDAO
	private BibesDAO bibesDAO;

	private BTypesDAO bTypesDAO;

	private BIngredientsDAO bIngredientsDAO;

	private BMlPricesDAO bMlPricesDAO;

	private BDetailsDAO bDetailsDAO;

	// Setter bibesDAO
	public void setBibesDAO(BibesDAO bibesDAO) {
		this.bibesDAO = bibesDAO;
	}
	

	public void setbIngredientsDAO(BIngredientsDAO bIngredientsDAO) {
		this.bIngredientsDAO = bIngredientsDAO;
	}

	public void setbMlPricesDAO(BMlPricesDAO bMlPricesDAO) {
		this.bMlPricesDAO = bMlPricesDAO;
	}

	public void setbDetailsDAO(BDetailsDAO bDetailsDAO) {
		this.bDetailsDAO = bDetailsDAO;
	}

	public void setbTypesDAO(BTypesDAO bTypesDAO) {
		this.bTypesDAO = bTypesDAO;
	}

	// 2020.08.08
	// 비베 검색 메서드 이원희
	@Override
	public List<Bibe> bibeSearch(String bibeName) {

		return bibesDAO.selectSearch(bibeName);
	}

	// 2020.08.09
	// 비베 인서트 메서드 이원희
	@Override
	public void addBibe(Bibe bibe, String bibeBrand, double bibeAvb, int[] bibeMl, int[] bibePrice, HttpSession session,
			int[] ingRatio, int[] bibeIng) {

		User user = (User) session.getAttribute("loginUser");

		bibe.setUserNo(user.getNo());

		int bibeResult = bibesDAO.insert(bibe);

		// bibeType이 칵테일일때
		if (bibe.getbTypeNo() == 5) {

			for (int i = 0; i < ingRatio.length; i++) {
				System.out.println("비율 : " + ingRatio[i]);
				System.out.println("재료번호 : " + bibeIng[i]);
				BIngredient bIngredient = new BIngredient(ingRatio[i], bibeIng[i], bibe.getBibeNo());
				int bIngredientResult = bIngredientsDAO.insert(bIngredient);
				System.out.println(bIngredientResult);
			} // for end
		} else {
			// 칵테일이 아닐 때
			int nowbibe = bibe.getBibeNo();
			BDetail bDetail = new BDetail(nowbibe, bibeBrand, bibeAvb);
			int bDetailResult = bDetailsDAO.insert(bDetail);
			System.out.println(bibeResult);
			System.out.println(bDetailResult);

			int nowBibeNo = bibe.getBibeNo();
			System.out.println(nowBibeNo);

			for (int i = 0; i < bibeMl.length; i++) {
				System.out.println("용량:" + bibeMl[i]);
				System.out.println("가격:" + bibePrice[i]);
				BMlPrice bMlPrice = new BMlPrice(bibeMl[i], bibePrice[i], nowbibe);
				int resultBMlPrice = bMlPricesDAO.insert(bMlPrice);
				System.out.println(resultBMlPrice);
			} // for end

		}

	}

	@Override
	public Map<String, Object> getBibeLists(int page) {

		Map<String, Object> modelMap = new ConcurrentHashMap<String, Object>();

		int numPage = 8;

		PageVO pageVO = new PageVO(page, numPage);
		List<Bibe> bibes = bibesDAO.selectList(pageVO);

		int total = bibesDAO.selectTotal();

		String paginate = PaginateUtil.getPaginate(page, total, numPage, 8, "/feria_bibe_communityList.feria", "page=");

		modelMap.put("bibes", bibes);
		modelMap.put("paginate", paginate);
		modelMap.put("total", total);

		return modelMap;

	}// getBibeLists end() 0809-오후 5시 노수한

	/* 2020.08.07. Kelly */
	@Override
	public List<Bibe> getSearchBibe(String bibeName) {
		return bibesDAO.selectSearch(bibeName);
	}

	@Override
	public List<Bibe> getLikeBibe(int userNo) {
		return bibesDAO.selectLikeBibe(userNo);
	}

	@Override
	public Bibe getLikeBibeDetail(int bibeNo) {
		return bibesDAO.selectOneLikeBibe(bibeNo);
	}

	@Override
	public List<Bibe> getLikeCocktail(int bibeNo) {
		return bibesDAO.selectOneLikeCocktail(bibeNo);
	}

	// 2020-08-11 박상훈 멤버필드 선언
	private UsersDAO usersDAO;

	// 2020-08-11 박상훈 세터 선언
	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}


	// 2020-08-12 이원희 추상메서드 구현
	// 선생님 피드백 : ajax만 호출하는 것은 List로 해도 된다. -> Map을 List로 변경
	@Override
	public List<Bibe> getHostsBibeList(Bibe bibe) {

		// bibes를 null로 초기화 후
		List<Bibe> bibes = null;

		// if문 bibe의 val 값이 2라면 Default 구문을 실행
		// 2가 아닐 경우 Val 구문을 실행
		if (bibe.getVal() == 2) {
			bibes = bibesDAO.selectHostsBibeDefault(bibe);
			System.out.println(bibes);
		} else {
			bibes = bibesDAO.selectHostBibeVal(bibe);
			System.out.println(bibes);
		}

		System.out.println("service :" + bibe.getVal());

		// bibes를 리턴
		return bibes;

		// return bibesDAO.selectHostsBibeList(bibe);
	}
	
	@Override
	public List<Bibe> getBibeComm(int page) {
		
		int pageNo = page;
		
		int numPage = 8;
		
		PageVO pageVO = new PageVO(pageNo, numPage);
		
		
		return bibesDAO.selectBibeCommunity(pageVO);
	}

}
