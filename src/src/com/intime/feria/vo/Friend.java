package com.intime.feria.vo;

/**
 * @author Administrator
 *
 */
public class Friend {
	public int no, user1, user2, userNo;
	public String name, profileImg;
	
	public Friend() {
		// TODO Auto-generated constructor stub
	}
	
	public Friend(int user1, int user2) {
		this.user1 = user1;
		this.user2 = user2;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUser1() {
		return user1;
	}

	public void setUser1(int user1) {
		this.user1 = user1;
	}

	public int getUser2() {
		return user2;
	}

	public void setUser2(int user2) {
		this.user2 = user2;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
	
}
