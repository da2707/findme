package kr.co.findme.mystat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mystat")
public class MyStatController {
	@RequestMapping("/chart.do")
	public String chart() {
		return "/mystat/chart";
	}

	@RequestMapping("/graph.do")
	public String graph() {
		return "/mystat/graph";
	}

	@RequestMapping("/detail.do")
	public String detail() {
		return "/mystat/detail";
	}
}
