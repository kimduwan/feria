package com.intime.feria.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class PHead {

	private int prtcCntNo, prtcNo, userNo, rownum;
	private String prtcOpenStr, feriaName, cenaImg, cenaName;
	private char prtcOpen,cenaType;
	private Timestamp regdate;
	private Date feriaDate;
	private double lat, lng;
	
	public PHead() {
		// TODO Auto-generated constructor stub
	}
	
	public char getCenaType() {
		return cenaType;
	}
	public void setCenaType(char cenaType) {
		this.cenaType = cenaType;
	}
	

	public double getLat() {
		return lat;
	}

	public String getCenaName() {
		return cenaName;
	}

	public void setCenaName(String cenaName) {
		this.cenaName = cenaName;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}


	public String getFeriaName() {
		return feriaName;
	}

	public void setFeriaName(String feriaName) {
		this.feriaName = feriaName;
	}

	public String getCenaImg() {
		return cenaImg;
	}

	public void setCenaImg(String cenaImg) {
		this.cenaImg = cenaImg;
	}

	public Date getFeriaDate() {
		return feriaDate;
	}

	public void setFeriaDate(Date feriaDate) {
		this.feriaDate = feriaDate;
	}
	
	public int getRownum() {
		return rownum;
	}


	public void setRownum(int rownum) {
		this.rownum = rownum;
	}


	public void setPrtcOpenStr(String prtcOpenStr) {
		this.prtcOpenStr = prtcOpenStr;
	}


	public int getPrtcCntNo() {
		return prtcCntNo;
	}

	public void setPrtcCntNo(int prtcCntNo) {
		this.prtcCntNo = prtcCntNo;
	}

	public int getPrtcNo() {
		return prtcNo;
	}

	public void setPrtcNo(int prtcNo) {
		this.prtcNo = prtcNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	//prtcOpen을 String형으로 리턴
	public String getPrtcOpenStr() {
		if(prtcOpen=='Y') {
			return "공개";
		}else {
			return "비공개";
		}
	}
	public char getPrtcOpen() {
		return prtcOpen;
	}

	public void setPrtcOpen(char prtcOpen) {
		this.prtcOpen = prtcOpen;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}	
}
