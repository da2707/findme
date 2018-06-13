package kr.co.findme.repository.mapper;

import java.util.List;

import kr.co.findme.repository.domain.MyStat;

public interface MyStatMapper {
	
	public List<MyStat> selectDetailList(String id);

	public List<MyStat> selectChart(String id);
	
	public void insertChart(String id);

	public void updateChart(String id);
}
