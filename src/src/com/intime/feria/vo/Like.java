package com.intime.feria.vo;

public class Like {
	
	private char likesType;
	private int likesNo,typeNo,userNo;
	
	public Like(char likesType, int typeNo) {
		this.likesType = likesType;
		this.typeNo = typeNo;
	}

	public Like(char likesType, int typeNo, int userNo) {
		this.likesType = likesType;
		this.typeNo = typeNo;
		this.userNo = userNo;
	}

	public Like() {
		// TODO Auto-generated constructor stub
	}

	public int getLikesNo() {
		return likesNo;
	}

	public void setLikesNo(int likesNo) {
		this.likesNo = likesNo;
	}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public char getLikesType() {
		return likesType;
	}

	public void setLikesType(char likesType) {
		this.likesType = likesType;
	}
	
}
