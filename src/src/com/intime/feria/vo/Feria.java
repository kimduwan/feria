package com.intime.feria.vo;

import java.security.Timestamp;
import java.util.List;

public class Feria {
	
	private int feriaNo, maxCount, fdateNo;
	private String feriaName,hostName,profileImg,cenaImg,postcode,feriaDateChange;
	private char cenaType, mealType, feriaConfirm;
	private Timestamp feriaDate;
	//private List<fImg> fimg;
	/* 2020-08-09 장유정 */
	private int postCode, minCount,userNo, cenaNo, cityNo;
	private double lat, lng;
	private String feriaAddress, detailAddress, mealTime;
	private Timestamp feriaRegDate;

	public Feria() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Feria(String feriaName,String postcode,String feriaAddress,String detailAddress,double lat,double lng,
			int minCount,int maxCount, char mealType,String mealTime,int userNo,int cenaNo,int cityNo) {
		super();
		this.maxCount = maxCount;
		this.feriaName = feriaName;
		this.postcode = postcode;
		this.mealType = mealType;
		this.minCount = minCount;
		this.userNo = userNo;
		this.cenaNo = cenaNo;
		this.cityNo = cityNo;
		this.lat = lat;
		this.lng = lng;
		this.feriaAddress = feriaAddress;
		this.detailAddress = detailAddress;
		this.mealTime = mealTime;
	}

	

	public String getFeriaDateChange() {
		return feriaDateChange;
	}



	public void setFeriaDateChange(String feriaDateChange) {
		this.feriaDateChange = feriaDateChange;
	}



	public int getPostCode() {
		return postCode;
	}



	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}



	public int getMinCount() {
		return minCount;
	}



	public void setMinCount(int minCount) {
		this.minCount = minCount;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public int getCenaNo() {
		return cenaNo;
	}



	public void setCenaNo(int cenaNo) {
		this.cenaNo = cenaNo;
	}



	public int getCityNo() {
		return cityNo;
	}



	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}



	public double getLat() {
		return lat;
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



	public String getFeriaAddress() {
		return feriaAddress;
	}



	public void setFeriaAddress(String feriaAddress) {
		this.feriaAddress = feriaAddress;
	}



	public String getDetailAddress() {
		return detailAddress;
	}



	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}



	public String getMealTime() {
		return mealTime;
	}



	public void setMealTime(String mealTime) {
		this.mealTime = mealTime;
	}



	public Timestamp getFeriaRegDate() {
		return feriaRegDate;
	}



	public void setFeriaRegDate(Timestamp feriaRegDate) {
		this.feriaRegDate = feriaRegDate;
	}



	public Timestamp getFeriaDate() {
		return feriaDate;
	}



	public void setFeriaDate(Timestamp feriaDate) {
		this.feriaDate = feriaDate;
	}



	public int getMaxCount() {
		return maxCount;
	}



	public void setMaxCount(int maxCount) {
		this.maxCount = maxCount;
	}



	public int getFdateNo() {
		return fdateNo;
	}



	public void setFdateNo(int fdateNo) {
		this.fdateNo = fdateNo;
	}



	public String getCenaImg() {
		return cenaImg;
	}



	public void setCenaImg(String cenaImg) {
		this.cenaImg = cenaImg;
	}



	public char getMealType() {
		return mealType;
	}



	public void setMealType(char mealType) {
		this.mealType = mealType;
	}



	public char getFeriaConfirm() {
		return feriaConfirm;
	}



	public void setFeriaConfirm(char feriaConfirm) {
		this.feriaConfirm = feriaConfirm;
	}



	public int getFeriaNo() {
		return feriaNo;
	}

	public void setFeriaNo(int feriaNo) {
		this.feriaNo = feriaNo;
	}

	public String getFeriaName() {
		return feriaName;
	}

	public void setFeriaName(String feriaName) {
		this.feriaName = feriaName;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public char getCenaType() {
		return cenaType;
	}

	public void setCenaType(char cenaType) {
		this.cenaType = cenaType;
	}
	
	public String getDay() {
		switch (mealType) {
		case 'D' : return "저녁";
		case 'B' : return "아침";
		case 'L' : return "점심";
		default:return "ddd";
		}
	}



	public String getPostcode() {
		return postcode;
	}



	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	
	
}
