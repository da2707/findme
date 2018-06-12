package kr.co.findme.mystat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.findme.repository.domain.MyStat;
import kr.co.findme.repository.mapper.MyStatMapper;

@Service("myStatService")
public class MyStatServiceExec implements MyStatService {
	@Autowired
	private MyStatMapper statMapper;

	@Override
	public List<MyStat> retrieveDetail(String id) {
		return statMapper.selectDetailList(id);
	}

	@Override
	public List<MyStat> retrieveChart(String id) {
		return statMapper.selectChart(id);
	}

	@Override
	public void registChart(String id) {
		statMapper.insertChart(id);
	}
}
