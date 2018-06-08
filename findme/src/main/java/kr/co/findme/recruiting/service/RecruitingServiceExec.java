package kr.co.findme.recruiting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.findme.repository.domain.Recruiting;
import kr.co.findme.repository.mapper.RecruitingMapper;

@Service("recruitingService")
public class RecruitingServiceExec implements RecruitingService{
	
	@Autowired
	private RecruitingMapper mapper;
	
	public List<Recruiting> retrieveKey(String id) throws Exception{
		return mapper.retrieveKey(id);
	}

	public void insertKey(Recruiting recruiting) throws Exception {
		mapper.insertKey(recruiting);
	}

	@Override
	public void updateKey(Recruiting recruting) throws Exception {
		mapper.updateKey(recruting);	
	}

	
}
