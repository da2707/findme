package kr.co.findme.calendar.service;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.findme.repository.mapper.CalendarMapper;

@Service("calendarService")
public class CalendarServiceExec implements CalendarService {

	@Autowired
	private CalendarMapper mapper;
	
	@Override
	public List<Calendar> retrieveList() throws Exception {
		return mapper.selectCalendar();
	}
	
}
