package kr.co.findme.calendar.controller;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.findme.calendar.service.CalendarService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private CalendarService calendarService;
	
	@RequestMapping("/calendar.do")
	public String calendar() {
		return "calendar/calendar"; 
	}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public List<Calendar> list() throws Exception {
		List<Calendar> list = calendarService.retrieveList();
		System.out.println(list.toString());
		return list;
	}
}
