package kr.co.findme.repository.mapper;

import java.util.List;

import kr.co.findme.repository.domain.CodeFinalRound;
import kr.co.findme.repository.domain.Schedule;
import kr.co.findme.repository.domain.SearchCodeArea;
import kr.co.findme.repository.domain.SearchCodeGraduate;
import kr.co.findme.repository.domain.SearchCodeJobType;

public interface ScheduleMapper {
	// Ķ���� ������ ����
	List<Schedule> selectSchedule(String userId);
	Schedule selectScheduleOne(Schedule schedule);
	List<CodeFinalRound> selectCodeFinalRound();
	CodeFinalRound selectCodeFinalRoundByNo(String codeNo);
	void updateBatchDate(Schedule schedule);
	void updateApply(Schedule schedule);
	void registFR(Schedule schedule);
	void registCondition(Schedule schedule);
	void resultSelect(Schedule schedule);
	void deleteSchedule(Schedule schedule);
	// �˻� ���� ������ ����
	List<SearchCodeArea> selectCodeArea();
	List<SearchCodeGraduate> selectCodeGraduate();
	List<SearchCodeJobType> selectCodeJobType();
}
