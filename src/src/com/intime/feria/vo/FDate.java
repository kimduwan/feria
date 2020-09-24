package com.intime.feria.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

public class FDate {

	private int fDateNo,frNo,feriaNo;
	private String feriaName,hostName;
	private char cenaType;
	private List<FImage> fImages;
	private List<PHead> pHeads;
	/*2020.08.13 조현득*/
	private String profileImg;
	private boolean feriaFlag;
	private int likeCount;
	/*0808 김우석 추가*/
	private Calendar calander;

	private int guestNo,hostNo,bibeNo;

	private String guestName,fImg;
	private Date feriaDate;
	private String bibeName,bibeImg;
	private String guestProfileImg;
	private int year,month,date,hour,min;
	
	/*2020 08 11 김우석 추가*/
	private String bTypeName;
	private int bibeMl;
	private int bibeCnt;
	
	private String feriaAddress;
	private double lat,lng;
	private char mealType;
	
	public FDate() {
		/*0808 김우석 추가*/
		calander=Calendar.getInstance();
		// TODO Auto-generated constructor stub
	}

	public FDate(int feriaNo, Date feriaDate) {
		super();
		this.feriaNo = feriaNo;
		this.feriaDate = feriaDate;
	}


	/*0808 김우석 추가: 리뷰작성하기 자격여부(id="selectOkToReview")
	 * 에 파라이터 타입으로 추가해주기 위해
	 * */
	/*0808 김우석 추가: 리뷰작성하기 자격여부(id="selectOkToReview")
	 * 에 파라이터 타입으로 추가해주기 위해
	 * */
	
	public char getMealType() {
		return mealType;
	}

	public void setMealType(char mealType) {
		this.mealType = mealType;
	}
	
	
	
	public String getFeriaAddress() {
		return feriaAddress;
	}

	public void setFeriaAddress(String feriaAddress) {
		this.feriaAddress = feriaAddress;
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
	
	public String getbTypeName() {
		return bTypeName;
	}
	public void setbTypeName(String bTypeName) {
		this.bTypeName = bTypeName;
	}
	public int getBibeMl() {
		return bibeMl;
	}
	public void setBibeMl(int bibeMl) {
		this.bibeMl = bibeMl;
	}
	public int getBibeCnt() {
		return bibeCnt;
	}
	public void setBibeCnt(int bibeCnt) {
		this.bibeCnt = bibeCnt;
	}
	public int getYear() {
		return calander.get(Calendar.YEAR);
	}
	public int getMonth() {
		return calander.get(Calendar.MONTH);
	}
	public int getDate() {
		return calander.get(Calendar.DATE);
	}
	public int getHour() {
		return calander.get(Calendar.HOUR);
	}
	public int getMin() {
		return calander.get(Calendar.MINUTE);
	}
	public FDate(int fDateNo, int guestNo) {
		super();
		this.fDateNo = fDateNo;
		this.guestNo = guestNo;
	}
	
	public Calendar getCalander() {
		return calander;
	}
	public void setCalander(Calendar calander) {
		this.calander = calander;
		
	}
	
	public int getBibeNo() {
		return bibeNo;
	}
	public void setBibeNo(int bibeNo) {
		this.bibeNo = bibeNo;
	}
	
	public int getHostNo() {
		return hostNo;
	}
	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}
	
	public String getBibeImg() {
		return bibeImg;
	}
	public void setBibeImg(String bibeImg) {
		this.bibeImg = bibeImg;
	}
	
	public String getBibeName() {
		return bibeName;
	}
	public void setBibeName(String bibeName) {
		this.bibeName = bibeName;
	}

	public Date getFeriaDate() {
		return feriaDate;
	}
	public void setFeriaDate(Date feriaDate) {
		this.feriaDate = feriaDate;
		calander.setTime(this.feriaDate);
		this.year=this.getYear();
		this.month=this.getMonth()+1;
		this.date=this.getDate();
		this.hour=this.getHour();
		this.min=this.getMin();
	}

	public String getfImg() {
		return fImg;
	}

	public void setfImg(String fImg) {
		this.fImg = fImg;
	}
	
	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	
	public int getGuestNo() {
		return guestNo;
	}

	public void setGuestNo(int guestNo) {
		this.guestNo = guestNo;
	}
	
	public int getFrNo() {
		return frNo;
	}

	public void setFrNo(int frNo) {
		this.frNo = frNo;
	}
	
	public List<PHead> getpHeads() {
		return pHeads;
	}

	public void setpHeads(List<PHead> pHeads) {
		this.pHeads = pHeads;
	}
	
	public List<FImage> getfImages() {
		return fImages;
	}

	public void setfImages(List<FImage> fImages) {
		this.fImages = fImages;
	}

	public int getfDateNo() {
		return fDateNo;
	}

	public void setfDateNo(int fDateNo) {
		this.fDateNo = fDateNo;
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

	public String getGuestProfileImg() {
		return guestProfileImg;
	}

	public void setProfileImg(String guestProfileImg) {
		this.guestProfileImg = guestProfileImg;
	}

	public char getCenaType() {
		return cenaType;
	}

	public void setCenaType(char cenaType) {
		this.cenaType = cenaType;
	}
	public int getFeriaNo() {
		return feriaNo;
	}
	public void setFeriaNo(int feriaNo) {
		this.feriaNo = feriaNo;
	}

	public boolean isFeriaFlag() {
		return feriaFlag;
	}

	public void setFeriaFlag(boolean feriaFlag) {
		this.feriaFlag = feriaFlag;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public String getProfileImg() {
		return profileImg;
	}

	
	
}