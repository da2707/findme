package kr.co.findme.repository.mapper;

import java.util.List;

import kr.co.findme.repository.domain.Schedule;

public interface ScheduleMapper {
	List<Schedule> selectSchedule() throws Exception;
	void updateDate(Schedule schedule) throws Exception;
}
