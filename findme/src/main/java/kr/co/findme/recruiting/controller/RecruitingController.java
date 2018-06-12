package kr.co.findme.recruiting.controller;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.findme.recruiting.service.RecruitingService;
import kr.co.findme.recruiting.util.RecruitingUtil;
import kr.co.findme.repository.domain.HireInfo;
import kr.co.findme.repository.domain.Recruiting;

@Controller
@RequestMapping("/recruiting")
public class RecruitingController {
	
	
	
	private int start = 0;
	@Autowired
	private RecruitingService service;
	
	@RequestMapping("/makeHireInfo.json")
	@ResponseBody
	public List<HireInfo> makeHireInfo(String id){
		try {
			System.out.println("세션 ID 값 : " + id);
			Recruiting recruitingList = service.retrieveKey(id);
			System.out.println(recruitingList);
			
			String job1 = recruitingList.getJobType1();
			String job2 = recruitingList.getJobType2();
			String loc1 = recruitingList.getLocation1();
			String loc2 = recruitingList.getLocation2();
			String edu = recruitingList.getEducation();
			String career = recruitingList.getCareer();
			String pos = recruitingList.getPosition();
//			System.out.println("잡타입1 : " + hi);
			String modi_time="";
			String expi_time="";
			String company="";
			String position="";
			
			String apiTitle;
			String apiJob1= null;
			String apiJob2= null;
			String apiLoc = null;
			String apiPos = null;
			String apiExpLev= null;
			String apiEduLev= null;
			String apiUrl1 = null;
			String apiUrl2 = null;
			
			RecruitingUtil ru = new RecruitingUtil();
			List<HireInfo> hireList = new ArrayList<>();

//			String postParams = "start=0&count=10";
			String postParams = "";
			System.out.println("-------------------------------" + start);
				postParams = "start="+ start +"&count=10";
			URL apiUrl = new URL("http://api.saramin.co.kr/job-search?" + postParams);

				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder parser = factory.newDocumentBuilder();
				Document doc = parser.parse(apiUrl.openStream());
					
				// jobs 태그내의 속성 꺼내기 
//				NodeList jobs = doc.getElementsByTagName("jobs");
//				for(int i=0; i<jobs.getLength(); i++) {
//					Node jobsNode = jobs.item(i);
//					Element jobsElement = (Element)jobsNode;
//					
//					String jobsEl = jobsElement.getAttribute("total");
//					totalCnt=jobsEl;
//					System.out.println(jobsEl);
//				}
				
				// 문서 내에서 job 태그에 해당하는 Node 정보를 리스트에 담는다
				NodeList list = doc.getElementsByTagName("job");
				for (int i = 0; i < list.getLength(); i++) {
					Node node = list.item(i);
					HireInfo info = new HireInfo();
					String name = node.getNodeName();
					if (name.equals("#text")) continue;
				
					// job 태그 내부의 자식 노드들을 찾아 리스트에 담는다
					NodeList cList = node.getChildNodes();
					int match=0;
					for (int j = 0; j < cList.getLength(); j++) {
						Node cNode = cList.item(j);
						String cName = cNode.getNodeName();
						String cTime = "";
						
						if(cName.equals("url")) {
							apiUrl1=cNode.getTextContent();
							System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"+apiUrl1);
						}
						
						
						// 만약 자식 노드의 이름이 timestamp로 끝나면 long 타입으로 적용시켜
						// 날짜 형태로 출력
						if (cName.endsWith("timestamp")) {
							Long time = Long.parseLong(cNode.getTextContent()) * 1000;
							
							Date cDate = new Date(time);
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							cTime = sdf.format(cDate);							
//							System.out.println("태그명 : " + cName + ", 값 : " + cTime);
							if(cName.equals("modification-timestamp")) {
								modi_time = cTime;
								System.out.println("수정일 : " + modi_time);
							}
							if(cName.equals("expiration-timestamp")) {
								expi_time = cTime;
								System.out.println("마감일 : " + expi_time);
							}
							continue;
						}
						if (cName.equals("#text")) continue;

//						System.out.println("태그명 : " + cName + ", 값 : " + cNode.getTextContent());
						if(cName.equals("company")) {
							company = cNode.getTextContent();
							System.out.println("회사 : " + cNode.getTextContent());
							
							NodeList cpList = cNode.getChildNodes();
							for(int p = 0; p<cpList.getLength(); p++) {
								Node cpNode = cpList.item(p);
								String cpName = cpNode.getNodeName();
								
								if (cpName.equals("#text")) continue;
								if (cpName.equals("name")) {
									Element cpElement = (Element)cpNode;
									String cpEl = cpElement.getAttribute("href");
									apiUrl2 = cpEl;
									System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2"+apiUrl2);
								}
							}
							
						}
						if(cName.equals("position")) {
							NodeList pList = cNode.getChildNodes();
							int match1 = 0;
							for(int k = 0; k< pList.getLength(); k++) {
								Node pNode = pList.item(k);
								String pName = pNode.getNodeName();
										
								if (pName.equals("#text")) continue;
								
								if(pName.equals("title")) {
									apiTitle = pNode.getTextContent();
								}
								
								if(pName.equals("location")) {
									apiLoc = pNode.getTextContent();
									if(apiLoc.contains(loc1) || apiLoc.contains(loc2)) {
										match1+=20;
									}
								}
								if(pName.equals("job-type")) {
									apiPos = pNode.getTextContent();
									if(apiPos.contains(pos)){
										match1+=10;
									}
								} 
								if(pName.equals("industry")) {
									apiJob1 = pNode.getTextContent();
									if(apiJob1.contains(job1) || apiJob1.contains(job2)) {
										match1+=20;
									}
								}
								if(pName.equals("job-category")) {
									apiJob2 = pNode.getTextContent();
									if(apiJob2.contains(job1) || apiJob2.contains(job2)) {
										match1+=20;
									}
								}
								if(pName.equals("experience-level")) {
									apiExpLev = pNode.getTextContent();
									if(apiExpLev.contains(career)) {
										match1+=15;
									}
								}
								if(pName.equals("required-education-level")) {
									apiEduLev = pNode.getTextContent();
									if(apiEduLev.contains(edu)) {
										match1+=15;
									}
								}
								System.out.println("태그명 : " + pName + ", 값 : " + pNode.getTextContent());
							}
							match = match1;
							position = cNode.getTextContent();
							System.out.println("채용정보 : " + cNode.getTextContent());
							}
						}
						System.out.println("----------match--------------------" + match);
						info.setMatchs(match);
						info.setModitimes(modi_time);
						info.setExpitimes(expi_time);
						info.setCompanies(company);
						info.setPositions(position);
						info.setApiEduLev(apiEduLev);
						info.setApiExpLev(apiExpLev);
						info.setApiJob1(apiJob1);
						info.setApiLoc(apiLoc);
						info.setApiPos(apiPos);
						info.setApiUrl1(apiUrl1);
						info.setApiUrl2(apiUrl2);
						hireList.add(info);
					}
				
			start+=10;
			return hireList;
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	
	@RequestMapping("/hireInfo.do")
	public String hireInfo(HttpSession session,Recruiting recruiting, Model model) {
		return "/recruiting/hireinfo";
	}
	
	@RequestMapping("/manageKey.do")
	public String manageKey(HttpSession session, Model model) throws Exception {
		String id = (String)session.getAttribute("id");
		System.out.println("세션 ID 값 : " + id);
		Recruiting recruitingList = service.retrieveKey(id);
		System.out.println(recruitingList);
		model.addAttribute("recruiting",recruitingList);
		return "/recruiting/managekey";
	}
	
	@RequestMapping("/insertKey.json")
	@ResponseBody
	public Recruiting insertKey(Recruiting recruiting) throws Exception {
		System.out.println(recruiting.getId());
		service.insertKey(recruiting);
		Recruiting recruitingList = service.retrieveKey(recruiting.getId());
		return recruitingList;
	}
	
	@RequestMapping("/updateKey.json")
	@ResponseBody
	public Recruiting updateKey(Recruiting recruiting) throws Exception {
		service.updateKey(recruiting);
		Recruiting recruitingList = service.retrieveKey(recruiting.getId());
		return recruitingList;
	}
	
}



