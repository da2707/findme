package kr.co.findme.schedule.service;

import java.util.List;

import kr.co.findme.repository.domain.CodeFinalRound;
import kr.co.findme.repository.domain.Schedule;
import kr.co.findme.repository.domain.SearchCodeArea;
import kr.co.findme.repository.domain.SearchCodeGraduate;
import kr.co.findme.repository.domain.SearchCodeJobType;

public interface ScheduleService {
	// 캘린더 관리용 메서드
	public List<Schedule> retrieveList(String userId) throws Exception;
	public Schedule retrieveOne(Schedule schedule) throws Exception; 
	public List<CodeFinalRound> retrieveCodeFR() throws Exception;
	public CodeFinalRound retrieveCodeFRByNo(String codeNo) throws Exception;
	public void updateBatchDate(Schedule schedule) throws Exception;
	public void updateApply(Schedule schedule) throws Exception;
	public void registFR(Schedule schedule) throws Exception;
	public void registCondition(Schedule schedule) throws Exception;
	public void resultSelect(Schedule schedule) throws Exception;
	public void deleteSchedule(Schedule schedule) throws Exception;
	public void insertSchedule(Schedule schedule) throws Exception;
	// 검색 영역 관리용 메서드
	public List<SearchCodeArea> loadCodeArea() throws Exception;
	public List<SearchCodeGraduate> loadCodeGraduate() throws Exception;
	public List<SearchCodeJobType> loadCodeJobType() throws Exception;
}
