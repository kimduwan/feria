package com.intime.feria.vo;

import java.security.Timestamp;

public class Request {
	public int no, user1, user2, userNo;
	public char reqState;
	public String name, profileImg;
	public Timestamp reqRegdate;
	
	public Request() {
		// TODO Auto-generated constructor stub
	}

	public Request(int user1, int user2) {
		this.user1 = user1;
		this.user2 = user2;
	}
	
	public Request(int no, int user1, int user2) {
		this.no = no;
		this.user1 = user1;
		this.user2 = user2;
	}
	
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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

	public char getReqState() {
		return reqState;
	}

	public void setReqState(char reqState) {
		this.reqState = reqState;
	}

	public Timestamp getReqRegdate() {
		return reqRegdate;
	}

	public void setReqRegdate(Timestamp reqRegdate) {
		this.reqRegdate = reqRegdate;
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
