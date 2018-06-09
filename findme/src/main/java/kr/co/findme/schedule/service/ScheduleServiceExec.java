package kr.co.findme.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.findme.repository.domain.CodeFinalRound;
import kr.co.findme.repository.domain.Schedule;
import kr.co.findme.repository.domain.SearchCodeArea;
import kr.co.findme.repository.domain.SearchCodeGraduate;
import kr.co.findme.repository.domain.SearchCodeJobType;
import kr.co.findme.repository.mapper.ScheduleMapper;

@Service("scheduleService")
public class ScheduleServiceExec implements ScheduleService {

	@Autowired
	private ScheduleMapper mapper;
	
	// 캘린더 관리용 메서드
	@Override
	public List<Schedule> retrieveList(String userId) throws Exception {
		return mapper.selectSchedule(userId);
	}
	
	@Override
	public Schedule retrieveOne(Schedule schedule) throws Exception {
		return mapper.selectScheduleOne(schedule);
	}
	
	
	@Override
	public List<CodeFinalRound> retrieveCodeFR() throws Exception {
		return mapper.selectCodeFinalRound();
	}

	@Override
	public CodeFinalRound retrieveCodeFRByNo(String codeNo) throws Exception {
		return mapper.selectCodeFinalRoundByNo(codeNo);
	}

	@Override
	public void updateBatchDate(Schedule schedule) throws Exception {
		mapper.updateBatchDate(schedule);
	}

	@Override
	public void updateApply(Schedule schedule) throws Exception {
		mapper.updateApply(schedule);
	}

	@Override
	public void registFR(Schedule schedule) throws Exception {
		mapper.registFR(schedule);
	}

	@Override
	public void registCondition(Schedule schedule) throws Exception {
		mapper.registCondition(schedule);
	}

	@Override
	public void resultSelect(Schedule schedule) throws Exception {
		mapper.resultSelect(schedule);
	}

	@Override
	public void deleteSchedule(Schedule schedule) throws Exception {
		mapper.deleteSchedule(schedule);
	}

	// 검색 영역 생성용 메서드
	@Override
	public List<SearchCodeArea> loadCodeArea() throws Exception {
		return mapper.selectCodeArea();
	}

	@Override
	public List<SearchCodeGraduate> loadCodeGraduate() throws Exception {
		return mapper.selectCodeGraduate();
	}

	@Override
	public List<SearchCodeJobType> loadCodeJobType() throws Exception {
		return mapper.selectCodeJobType();
	}
}
