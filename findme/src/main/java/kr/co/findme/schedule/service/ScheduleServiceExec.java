package kr.co.findme.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.findme.repository.domain.Schedule;
import kr.co.findme.repository.mapper.ScheduleMapper;

@Service("scheduleService")
public class ScheduleServiceExec implements ScheduleService {

	@Autowired
	private ScheduleMapper mapper;
	
	@Override
	public List<Schedule> retrieveList() throws Exception {
		return mapper.selectSchedule();
	}
	
}
