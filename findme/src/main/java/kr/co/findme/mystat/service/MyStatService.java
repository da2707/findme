package kr.co.findme.mystat.service;

import java.util.List;

import kr.co.findme.repository.domain.MyStat;

public interface MyStatService {
	
	public List<MyStat> retrieveDetail(String id);
	
	public List<MyStat> retrieveChart(String id);
	
	public void registChart(String id);
}
