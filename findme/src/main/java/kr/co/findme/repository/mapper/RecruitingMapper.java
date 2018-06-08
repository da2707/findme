package kr.co.findme.repository.mapper;

import java.util.List;

import kr.co.findme.repository.domain.Recruiting;

public interface RecruitingMapper {

	public List<Recruiting> retrieveKey(String id) throws Exception;

	public void insertKey(Recruiting recruiting) throws Exception;
	
	public void updateKey(Recruiting recruting) throws Exception;
}
