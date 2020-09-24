package com.intime.feria.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.intime.feria.vo.Friend;
import com.intime.feria.vo.PageVO;

public class FriendsDAOImpl implements FriendsDAO{
	
	/* 2020-08-07 장유정(기본세팅) */
	// 멤버필드
	private SqlSession session;
	
	// setter
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<Friend> selectFriendList(PageVO pageVO) {
		return session.selectList("friends.selectFriendList", pageVO);
	}
	
	@Override
	public int selectTotal(int no) {
		return session.selectOne("friends.selectTotal", no);
	}
	
	@Override
	public int insertFriend(Friend friend) {
		return session.insert("friends.insertFriend", friend);
	}
	
	@Override
	public Friend checkFriend(Friend friend) {
		return session.selectOne("friends.checkFriend", friend);
	}
	
	@Override
	public int deleteFriend(Friend friend) {
		return session.delete("friends.deleteFriend", friend);
	}
	
	@Override
	public List<Friend> friendList(int no) {
		return session.selectList("friends.friendList", no);
	}
	
}