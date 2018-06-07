package kr.co.findme.repository.domain;

public class Recruiting {
    // 직종 1
    private String jobType1;
    
    // 직종 2
    private String jobType2;

	// 지역 1
    private String location1;

    // 지역 2
    private String location2;

    // 학력 
    private String education;

    // 경력 
    private String career;

    // 급여조건 
    private String salary;

    // 근무형태 
    private String position;

    // 회사명 
    private String companyName;

    // 회원 id 
    private String id;

    public String getJobType1() {
        return jobType1;
    }
    
    public void setJobType1(String jobType1) {
    	this.jobType1 = jobType1;
    }
    
    public String getJobType2() {
    	return jobType2;
    }
    
    public void setJobType2(String jobType2) {
    	this.jobType2 = jobType2;
    }
    

    public String getLocation1() {
        return location1;
    }

    public void setLocation1(String location1) {
        this.location1 = location1;
    }

    public String getLocation2() {
    	return location2;
    }
    
    public void setLocation2(String location2) {
    	this.location2 = location2;
    }
    
    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getCareer() {
        return career;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
