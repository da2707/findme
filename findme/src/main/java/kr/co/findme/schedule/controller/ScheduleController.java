package kr.co.findme.schedule.controller;

import java.io.DataOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.findme.repository.domain.CodeFinalRound;
import kr.co.findme.repository.domain.Schedule;
import kr.co.findme.repository.domain.SearchCodeArea;
import kr.co.findme.repository.domain.SearchCodeGraduate;
import kr.co.findme.repository.domain.SearchCodeJobType;
import kr.co.findme.repository.domain.SearchParameter;
import kr.co.findme.repository.domain.SearchResult;
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
	public List<Schedule> list(String userId) throws Exception {
		List<Schedule> list = scheduleService.retrieveList(userId);
		return list;
	}	
	
	@RequestMapping("/updateBatchDate.json")
	@ResponseBody
	public void updateDate(Schedule schedule) throws Exception {
		System.out.println("�궇�옄 利앷컧媛� : " + schedule.getDays());
		scheduleService.updateBatchDate(schedule);
	}
	
	@RequestMapping("/updateApply.json") 
	@ResponseBody
	public Schedule updateApply(Schedule schedule) throws Exception {
		scheduleService.updateApply(schedule);
		Schedule s = scheduleService.retrieveOne(schedule);
		return s;
	}
	
	@RequestMapping("/loadCodeFR.json")
	@ResponseBody
	public List<CodeFinalRound> loadCodeFR() throws Exception {
		List<CodeFinalRound> list = scheduleService.retrieveCodeFR();
		return list;
	}
	
	@RequestMapping("/registFR.json")
	@ResponseBody
	public Schedule registFR(Schedule schedule) throws Exception {
		scheduleService.registFR(schedule);
		Schedule list = scheduleService.retrieveOne(schedule);
		return list;
	}
	
	@RequestMapping("/registCondition.json")
	@ResponseBody
	public Schedule registCondition(Schedule schedule) throws Exception {
		scheduleService.registCondition(schedule);
		Schedule list = scheduleService.retrieveOne(schedule);
		return list;
	}
	
	@RequestMapping("/resultSelect.json")
	@ResponseBody
	public Schedule resultSelect(Schedule schedule) throws Exception {
		scheduleService.resultSelect(schedule);
		Schedule list = scheduleService.retrieveOne(schedule);
		return list;
	}
	
	@RequestMapping("/deleteSchedule.json")
	@ResponseBody
	public void deleteSchedule(Schedule schedule) throws Exception {
		System.out.println(schedule.getUserId());
		scheduleService.deleteSchedule(schedule);
	}
	
	// 검색 영역 생성을 위한 컨트롤러
	@RequestMapping("/loadCodeArea.json")
	@ResponseBody
	public List<SearchCodeArea> loadCodeArea() throws Exception {
		List<SearchCodeArea> list = scheduleService.loadCodeArea();
		return list;
	}
	
	@RequestMapping("/loadCodeGraduate.json")
	@ResponseBody
	public List<SearchCodeGraduate> loadCodeGraduate() throws Exception {
		List<SearchCodeGraduate> list = scheduleService.loadCodeGraduate();
		return list;
	}
	
	@RequestMapping("/loadCodeJobType.json")
	@ResponseBody
	public List<SearchCodeJobType> loadCodeJobType() throws Exception {
		List<SearchCodeJobType> list = scheduleService.loadCodeJobType();
		return list;
	}
	
	// 검색 결과 테이블에 있는 정보를 캘린더 DB에 삽입
	@RequestMapping("/insertCalendar.json")
	@ResponseBody
	public void insertCalendar(Schedule schedule) throws Exception {
		System.out.println(schedule.getUserId());
		System.out.println(schedule.getTitle());
		System.out.println(schedule.getName());
		System.out.println(schedule.getStart());
		System.out.println(schedule.getEnd());
		System.out.println(schedule.getLink());
		System.out.println(schedule.getRecruitNo());
		scheduleService.insertSchedule(schedule);
	}
	
	@RequestMapping("/jobSearch.json")
	@ResponseBody
	public List<SearchResult> jobSearch(SearchParameter param) throws Exception {
		List<SearchResult> searchList = new ArrayList<>();
		String loc_cd = param.getLoc_cd();
		String edu_lv = param.getEdu_lv();
		String ind_cd = param.getInd_cd();
		String job_category = param.getJob_category();
		String job_type = param.getJob_type();
		StringBuffer sb = new StringBuffer();
		
		if (loc_cd != null) {
			if (sb.length() == 0) sb.append("loc_cd=" + loc_cd);
			else sb.append("&loc_cd=" + loc_cd);	
		}
		if (edu_lv != null) {
			if (sb.length() == 0) sb.append("edu_lv=" + edu_lv);
			else sb.append("&edu_lv=" + edu_lv);
		}
		if (ind_cd != null) {
			if (sb.length() == 0) sb.append("ind_cd=" + ind_cd);
			else sb.append("&ind_cd=" + ind_cd);
		}
		if (job_category != null) {
			if (sb.length() == 0) sb.append("job_category=" + job_category);
			else sb.append("&job_category=" + job_category);
		}
		if (job_type != null) {
			if (sb.length() == 0) sb.append("job_type=" + job_type);
			else sb.append("&job_type=" + job_type);
		}
		
		URL apiUrl = new URL("http://api.saramin.co.kr/job-search?");
		HttpURLConnection con = (HttpURLConnection)apiUrl.openConnection();
		con.setRequestMethod("POST");
		con.setDoOutput(true);
		DataOutputStream ws = new DataOutputStream(con.getOutputStream());
		ws.writeUTF(sb.toString());
		ws.flush();
		ws.close();
		
		int responseCode = con.getResponseCode();
		if (responseCode == 200) {
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder parser = factory.newDocumentBuilder();
			Document doc = parser.parse(con.getInputStream());
		
			NodeList list = doc.getElementsByTagName("job");
			for (int i = 0; i < list.getLength(); i++) {
				SearchResult sr = new SearchResult();
				Node nName = list.item(i);
				NodeList clist = nName.getChildNodes();
				// <job> 태그의 자식 태그 내용 가져오기
				for (int j = 0; j < clist.getLength(); j++) {
					Node cNode = clist.item(j);
					String cTagName = cNode.getNodeName();
					if (cTagName.equals("#text")) continue;
					
					if (cTagName.equals("id")) {
						sr.setRecruitNo(Integer.parseInt(cNode.getTextContent().trim()));
					}
					if (cTagName.equals("url")) {
						sr.setLink(cNode.getTextContent());
					}
					if (cTagName.equals("opening-timestamp")) {
						Long time = Long.parseLong(cNode.getTextContent()) * 1000;
						Date cDate = new Date(time);
						sr.setStartDate(cDate);
					}
					if (cTagName.equals("expiration-timestamp")) {
						Long time = Long.parseLong(cNode.getTextContent()) * 1000;
						Date cDate = new Date(time);
						sr.setEndDate(cDate);
					}
					if (cTagName.equals("company")) {
						sr.setCompany(cNode.getTextContent().trim());
					}
					// position 태그 내부의 자식 태그 정보 꺼내오기
					if (cTagName.equals("position")) {
						NodeList pList = cNode.getChildNodes();
						
						for (int k = 0; k < pList.getLength(); k++) {
							Node pNode = pList.item(k);
							String pTagName = pNode.getNodeName();
							if (pTagName.equals("title")) {
								sr.setTitle(pNode.getTextContent().trim());
							}
							if (pTagName.equals("job-type")) {
								sr.setJobType(pNode.getTextContent());
							}
							if (pTagName.equals("required-education-level")) {
								sr.setEduLv(pNode.getTextContent());
							}
							if (pTagName.equals("experience-level")) {
								sr.setExpLv(pNode.getTextContent());
							}
						}
					}
					
//					String cContent = cNode.getTextContent();
//					System.out.println(cTagName + " : " + cContent);
				}
//				String content = nName.getTextContent();
//				String tagName = nName.getNodeName();
//				System.out.println(tagName + " : " + content);
				searchList.add(sr);
			}
		}
		return searchList;
	}
	
	
	
}
