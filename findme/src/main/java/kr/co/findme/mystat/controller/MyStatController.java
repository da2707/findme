package kr.co.findme.mystat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.findme.mystat.service.MyStatService;
import kr.co.findme.repository.domain.MyStat;
import kr.co.findme.repository.domain.Video;

@Controller
@RequestMapping("/mystat")
public class MyStatController {
	@Autowired
	private MyStatService myStatService; 
	
	@RequestMapping("/chart.do")
	public String chart() {
		return "/mystat/chart";
	}

	@RequestMapping("/graph.do")
	public String graph() {
		return "/mystat/graph";
	}
	@RequestMapping("/noneGraph.do")
	public String noneGraph() {
		return "/mystat/noneGraph";
	}

	@RequestMapping("/detail.do")
	public String detail() {
		return "/mystat/detail";
	}
	
	@RequestMapping("/detailList.json")
	@ResponseBody
	public List<MyStat> retrieveDetail(HttpSession session, String id) {
		String loginId = (String) session.getAttribute("id");
		List<MyStat> list = myStatService.retrieveDetail(loginId);
		return list;
	}
	
	@RequestMapping("/chartList.json")
	@ResponseBody
	public List<MyStat> retrieveChart(HttpSession session, String id) {
		String loginId = (String) session.getAttribute("id");
		myStatService.updateChart(loginId);
		List<MyStat> chartList = myStatService.retrieveChart(loginId);
		System.out.println(chartList);
		return chartList;
	}
	
	@RequestMapping("/chartRegist.json")
	@ResponseBody
	public List<MyStat> registChart(HttpSession session, String id) {
		String loginId = (String) session.getAttribute("id");
		myStatService.registChart(loginId);
		List<MyStat> chartList = myStatService.retrieveChart(loginId);
		return chartList;
	}

//	@RequestMapping("/chartUpdate.json")
//	@ResponseBody
//	public List<MyStat> updateChart(HttpSession session, String id) {
//		String loginId = (String) session.getAttribute("id");
//		myStatService.updateChart(loginId);
//		List<MyStat> updateList = myStatService.retrieveChart(loginId);
//		return updateList;
//	}
}
