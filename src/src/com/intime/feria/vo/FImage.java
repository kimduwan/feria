package com.intime.feria.vo;

public class FImage {

	
	private int fImgNo,frNo,fDateNo,userNo;
	private String fImg,profileImg,feriaName;
	
	public FImage() {
		// TODO Auto-generated constructor stub
	}

	//2020 08 10 김우석 추가
		public FImage(int frNo, int fDateNo, String fImg) {
			super();
			this.frNo = frNo;
			this.fDateNo = fDateNo;
			this.fImg = fImg;
		}
	
	public int getfImgNo() {
		return fImgNo;
	}
	
	

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getFeriaName() {
		return feriaName;
	}

	public void setFeriaName(String feriaName) {
		this.feriaName = feriaName;
	}

	public void setfImgNo(int fImgNo) {
		this.fImgNo = fImgNo;
	}

	public int getFrNo() {
		return frNo;
	}

	public void setFrNo(int frNo) {
		this.frNo = frNo;
	}

	public int getfDateNo() {
		return fDateNo;
	}

	public void setfDateNo(int fDateNo) {
		this.fDateNo = fDateNo;
	}

	public String getfImg() {
		return fImg;
	}

	public void setfImg(String fImg) {
		this.fImg = fImg;
	}
	
}
