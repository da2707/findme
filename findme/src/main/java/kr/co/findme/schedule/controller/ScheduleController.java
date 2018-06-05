package kr.co.findme.schedule.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.findme.repository.domain.Schedule;
import kr.co.findme.schedule.service.ScheduleService;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping("/schedule.do")
	public String calendar() {
		return "schedule/schedule"; 
	}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public List<Schedule> list() throws Exception {
		List<Schedule> list = scheduleService.retrieveList();
		return list;
	}
	
	@RequestMapping("/updateDate.json") 
	@ResponseBody
	public void update(Schedule schedule) throws Exception {
		scheduleService.updateDate(schedule);
	}
}
