package com.intime.feria.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.intime.feria.vo.Gugun;
import com.intime.feria.vo.PageVO;
import com.intime.feria.vo.User;

@Repository
public class UsersDAOImpl implements UsersDAO {

	/* 2020-08-07 장유정(기본세팅) */
	// 멤버필드
	private SqlSession session;

	// setter
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public User selectLogin(User user) {
		return session.selectOne("users.selectLogin", user);
	}

	@Override
	public List<User> selectUserList() {
		return session.selectList("users.selectUserList");
	}

	@Override
	public int selectOne(String email) {
		return session.selectOne("users.selectOne", email);
	}

	@Override
	public int selectCheckEmail(String email) {
		return session.selectOne("users.selectCheckEmail", email);
	}

	@Override
	public int insert(User user) {
		return session.insert("users.joinInsert", user);
	}

	@Override
	public int selectTotalInvited() {
		return session.selectOne("users.selectTotalInvited");
	}

	@Override
	public int updateMypageFeriaPrivate(int prtcCntNo) {
		return session.update("users.updateMypageFeriaPrivate", prtcCntNo);
	}

	@Override
	public List<User> selectMypageFeriaList(PageVO pageVO) {
		return session.selectList("users.selectMypageFeriaList", pageVO);
	}

	/* 2020-08-09. 조현득 - 수정 */
	@Override
	public List<Gugun> selectGugunList(String cityNo) {
		return session.selectList("users.selectGugunList", cityNo);
	}

	// 2020-08-09 박상훈
	@Override
	public int selectTotal(int no) {
		return session.selectOne("users.selectTotal", no);
	}

	// 이원희 사람을 초대한 수
	@Override
	public int selectTotalInvite(int no) {

		return session.selectOne("users.selectInviteTotal", no);
	}

	// 이원희 페리아에 초대받은 수
	@Override
	public int selectTotalInvited(int no) {

		return session.selectOne("users.selectInvitedTotal", no);
	}

}
