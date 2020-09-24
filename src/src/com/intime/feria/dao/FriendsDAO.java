package com.intime.feria.dao;

import java.util.List;

import com.intime.feria.vo.Friend;
import com.intime.feria.vo.PageVO;

public interface FriendsDAO {
	
	/* 2020-08-07 장유정(기본세팅) */
	public List<Friend> selectFriendList(PageVO pageVO);
	public int selectTotal(int no);
	public int insertFriend(Friend friend);
	public int deleteFriend(Friend friend);
	public Friend checkFriend(Friend friend);
	
	/* 2020-08-09 장유정 */
	public List<Friend> friendList(int no);
}
