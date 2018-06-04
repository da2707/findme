package kr.co.findme.repository.domain;

import java.util.Date;

public class Calendar {
	private String id;
	private int uniqueNo;
	private int recruitNo;
	private String title;
	private String name;
	private Date regDate;
	private Date start;
	private Date end;
	private char apply;
	private String codeNo;
	private int finalRound;
	private char result;
	private String link;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getUniqueNo() {
		return uniqueNo;
	}
	public void setUniqueNo(int uniqueNo) {
		this.uniqueNo = uniqueNo;
	}
	public int getRecruitNo() {
		return recruitNo;
	}
	public void setRecruitNo(int recruitNo) {
		this.recruitNo = recruitNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public Date getStart() {
		return start;
	}
	public void setStart(Date start) {
		this.start = start;
	}
	public Date getEnd() {
		return end;
	}
	public void setEnd(Date end) {
		this.end = end;
	}
	public char getApply() {
		return apply;
	}
	public void setApply(char apply) {
		this.apply = apply;
	}
	public String getCodeNo() {
		return codeNo;
	}
	public void setCodeNo(String codeNo) {
		this.codeNo = codeNo;
	}
	public int getFinalRound() {
		return finalRound;
	}
	public void setFinalRound(int finalRound) {
		this.finalRound = finalRound;
	}
	public char getResult() {
		return result;
	}
	public void setResult(char result) {
		this.result = result;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
	
}
