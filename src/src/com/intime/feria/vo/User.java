package com.intime.feria.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class User {
	
	private int no, sidoNo, gugunNo;
	private String email,firstName,lastName,pwd,phoneNum,profileImg,profileCMT, feriaDateChange;
	private char userLV;
	private Date birth;
	private Timestamp joinDate;
	public static final String LOGIN = 
			"loginUser";
	
	//===================================================//
		private int prtcCntNo;
		private String feriaName, cenaImg, feriaConfirmStr, prtcOpenStr;
		private char cenaType, feriaConfirm, prtcOpen;
		private Timestamp feriaDate;
		//===================================================//
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
		//Timestamp를 YYYY MM DD형식으로 리턴
		public String getFeriaDateChange() {
			SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY년 MM월 dd일");
			String FeriaDateChange  = dateFormat.format(feriaDate);
			return FeriaDateChange;
		}
		public void setFeriaDateChange(String feriaDateChange) {
			this.feriaDateChange = feriaDateChange;
		}
		
		//prtcOpen을 String형으로 리턴
		public String getPrtcOpenStr() {
			if(prtcOpen=='Y') {
				return "공개";
			}else {
				return "비공개";
			}
		}
		public void setPrtcOpenStr(String prtcOpenStr) {
			this.prtcOpenStr = prtcOpenStr;
		}

		//feriaConfirmStr char형 String으로 형변환
		public String getFeriaConfirmStr() {
			if(feriaConfirm=='O') {
				return "페리아 대기중";
			}else if(feriaConfirm=='X') {
				return "페리아 취소";
			}else {
				return "인원 모집중";
			}
		}
		public void setFeriaConfirmStr(String feriaConfirmStr) {
			
			this.feriaConfirmStr = feriaConfirmStr;
		}
	
	//8개의 인자를 가지고 있는 생성자(JoinUser Servlet에 사용)	
	 public User(String email, String firstName, String lastName, String pwd, Date birth, String phoneNum, int sidoNo, int gugunNo) { 
		 super(); 
		 this.email = email; 
		 this.firstName = firstName; 
		 this.lastName = lastName; 
		 this.pwd = pwd; 
		 this.birth = birth; 
		 this.phoneNum = phoneNum; 
		 this.sidoNo = sidoNo; 
		 this.gugunNo = gugunNo;
	}
	
	public User(String email, String pwd) {
		this.email = email;
		this.pwd = pwd;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	public int getSidoNo() {
		return sidoNo;
	}
	public void setSidoNo(int sidoNo) {
		this.sidoNo = sidoNo;
	}
	public int getGugunNo() {
		return gugunNo;
	}
	public void setGugunNo(int gugunNo) {
		this.gugunNo = gugunNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getProfileCMT() {
		return profileCMT;
	}
	public void setProfileCMT(String profileCMT) {
		this.profileCMT = profileCMT;
	}
	public char getUserLV() {
		return userLV;
	}
	public void setUserLV(char userLV) {
		this.userLV = userLV;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public Timestamp getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
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

	public char getCenaType() {
		return cenaType;
	}

	public void setCenaType(char cenaType) {
		this.cenaType = cenaType;
	}

	public char getFeriaConfirm() {
		return feriaConfirm;
	}

	public void setFeriaConfirm(char feriaConfirm) {
		this.feriaConfirm = feriaConfirm;
	}

	public Timestamp getFeriaDate() {
		return feriaDate;
	}

	public void setFeriaDate(Timestamp feriaDate) {
		this.feriaDate = feriaDate;
	}
	
	public char getPrtcOpen() {
		return prtcOpen;
	}
	public void setPrtcOpen(char prtcOpen) {
		this.prtcOpen = prtcOpen;
	}

	public int getPrtcCntNo() {
		return prtcCntNo;
	}

	public void setPrtcCntNo(int prtcCntNo) {
		this.prtcCntNo = prtcCntNo;
	}	
	
}
