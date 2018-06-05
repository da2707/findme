package kr.co.findme.repository.domain;

import java.util.Date;

public class MyStat {
	private String id;
	private int recruitNo;
	private Date regDate;
	private String name;
	private int appCnt;
	private int firstCnt;
	private int secondCnt;
	private int thirdCnt;
	private int fourthCnt;
	private int fifthCnt;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRecruitNo() {
		return recruitNo;
	}
	public void setRecruitNo(int recruitNo) {
		this.recruitNo = recruitNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAppCnt() {
		return appCnt;
	}
	public void setAppCnt(int appCnt) {
		this.appCnt = appCnt;
	}
	public int getFirstCnt() {
		return firstCnt;
	}
	public void setFirstCnt(int firstCnt) {
		this.firstCnt = firstCnt;
	}
	public int getSecondCnt() {
		return secondCnt;
	}
	public void setSecondCnt(int secondCnt) {
		this.secondCnt = secondCnt;
	}
	public int getThirdCnt() {
		return thirdCnt;
	}
	public void setThirdCnt(int thirdCnt) {
		this.thirdCnt = thirdCnt;
	}
	public int getFourthCnt() {
		return fourthCnt;
	}
	public void setFourthCnt(int fourthCnt) {
		this.fourthCnt = fourthCnt;
	}
	public int getFifthCnt() {
		return fifthCnt;
	}
	public void setFifthCnt(int fifthCnt) {
		this.fifthCnt = fifthCnt;
	}
	@Override
	public String toString() {
		return "MyStat [id=" + id + ", recruitNo=" + recruitNo + ", regDate=" + regDate + ", name=" + name + ", appCnt="
				+ appCnt + ", firstCnt=" + firstCnt + ", secondCnt=" + secondCnt + ", thirdCnt=" + thirdCnt
				+ ", fourthCnt=" + fourthCnt + ", fifthCnt=" + fifthCnt + "]";
	}
}
