package kr.co.findme.repository.domain;

public class SearchParameter {
	private String loc_cd;
	private String ind_cd;
	private String job_category;
	private String job_type;
	private String edu_lv;
	public String getLoc_cd() {
		return loc_cd;
	}
	public void setLoc_cd(String loc_cd) {
		this.loc_cd = loc_cd;
	}
	public String getInd_cd() {
		return ind_cd;
	}
	public void setInd_cd(String ind_cd) {
		this.ind_cd = ind_cd;
	}
	public String getJob_category() {
		return job_category;
	}
	public void setJob_category(String job_category) {
		this.job_category = job_category;
	}
	public String getJob_type() {
		return job_type;
	}
	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}
	public String getEdu_lv() {
		return edu_lv;
	}
	public void setEdu_lv(String edu_lv) {
		this.edu_lv = edu_lv;
	}
	
	
}
