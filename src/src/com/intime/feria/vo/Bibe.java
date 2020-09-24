package com.intime.feria.vo;

import java.security.Timestamp;

public class Bibe {

	private int bibeNo,bTypeNo,userNo, btypeNo,Val;
	String bibeName,bibeImg,bibeDetail,lastName;
	private Timestamp bibeRegdate,lastModified;	

	public Bibe() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Bibe(int bTypeNo, int userNo, String bibeName, String bibeImg, String bibeDetail) {
		this.bTypeNo = bTypeNo;
		this.userNo = userNo;
		this.bibeName = bibeName;
		this.bibeImg = bibeImg;
		this.bibeDetail = bibeDetail;
	}

	

	public int getVal() {
		return Val;
	}



	public void setVal(int val) {
		Val = val;
	}



	public String getLastName() {
		return lastName;
	}



	public void setLastName(String lastName) {
		this.lastName = lastName;
	}



	public int getBibeNo() {
		return bibeNo;
	}

	public void setBibeNo(int bibeNo) {
		this.bibeNo = bibeNo;
	}

	public int getbTypeNo() {
		return bTypeNo;
	}

	public void setbTypeNo(int bTypeNo) {
		this.bTypeNo = bTypeNo;
	}

	public String getBibeName() {
		return bibeName;
	}

	public void setBibeName(String bibeName) {
		this.bibeName = bibeName;
	}

	public String getBibeImg() {
		return bibeImg;
	}

	public void setBibeImg(String bibeImg) {
		this.bibeImg = bibeImg;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getBtypeNo() {
		return btypeNo;
	}

	public void setBtypeNo(int btypeNo) {
		this.btypeNo = btypeNo;
	}

	public String getBibeDetail() {
		return bibeDetail;
	}

	public void setBibeDetail(String bibeDetail) {
		this.bibeDetail = bibeDetail;
	}

	public Timestamp getBibeRegdate() {
		return bibeRegdate;
	}

	public void setBibeRegdate(Timestamp bibeRegdate) {
		this.bibeRegdate = bibeRegdate;
	}

	public Timestamp getLastModified() {
		return lastModified;
	}

	public void setLastModified(Timestamp lastModified) {
		this.lastModified = lastModified;
	}

	
	
}
