package kr.co.findme.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	@RequestMapping("/calendar.do")
	public String calendar() {
		return "calendar/calendar"; 
	}
}
