package kr.co.findme.repository.domain;

import java.util.Date;

public class SearchResult {
	private int recruitNo;
	private Date startDate;
	private Date endDate;
	private String company;
	private String title;
	private String jobType;
	private String eduLv;
	private String expLv;
	private String link;
	public int getRecruitNo() {
		return recruitNo;
	}
	public void setRecruitNo(int recruitNo) {
		this.recruitNo = recruitNo;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getJobType() {
		return jobType;
	}
	public void setJobType(String jobType) {
		this.jobType = jobType;
	}
	public String getEduLv() {
		return eduLv;
	}
	public void setEduLv(String eduLv) {
		this.eduLv = eduLv;
	}
	public String getExpLv() {
		return expLv;
	}
	public void setExpLv(String expLv) {
		this.expLv = expLv;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
}
