package kr.co.findme.schedule.service;

import java.util.List;

import kr.co.findme.repository.domain.Schedule;

public interface ScheduleService {
	public List<Schedule> retrieveList() throws Exception;
	public void updateBatchDate(Schedule schedule) throws Exception;
}
