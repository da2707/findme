package kr.co.findme.recruiting.controller;

import java.io.DataOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.co.findme.recruiting.util.RecruitingUtil;

@Controller
@RequestMapping("/recruiting")
public class RecruitingController {
	@RequestMapping("/hireInfo.do")
	public String hireInfo(Model model) {
		try {
			String modi_time;
			String expi_time;
			String company;
			String position;
			String totalCnt;
			List<String> moditimes = new ArrayList<>();
			List<String> expitimes = new ArrayList<>();
			List<String> companies = new ArrayList<>();
			List<String> positions = new ArrayList<>();
			RecruitingUtil ru = new RecruitingUtil();

//			String postParams = "start=0&count=10";
			String postParams = "";
			for(int start=0; start<=30; start+=10) {
				System.out.println("-------------------------------" + start);
				postParams = "start="+start+"&count=10";
			URL apiUrl = new URL("http://api.saramin.co.kr/job-search?" + postParams);
//			HttpURLConnection con = (HttpURLConnection)apiUrl.openConnection();
//			con.setRequestMethod("POST");
//			con.setDoInput(true);
//			con.setDoOutput(true);
//			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
//			wr.writeUTF(postParams);
//			wr.flush();
//			wr.close();
			
//			int responseCode = con.getResponseCode();
//			if (responseCode == 200) {
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder parser = factory.newDocumentBuilder();
				Document doc = parser.parse(apiUrl.openStream());
				
				// jobs 태그내의 속성 꺼내기 
				NodeList jobs = doc.getElementsByTagName("jobs");
				for(int i=0; i<jobs.getLength(); i++) {
					Node jobsNode = jobs.item(i);
					Element jobsElement = (Element)jobsNode;
					
					String jobsEl = jobsElement.getAttribute("total");
					totalCnt=jobsEl;
					System.out.println(jobsEl);
				}
				
				// 문서 내에서 job 태그에 해당하는 Node 정보를 리스트에 담는다
				NodeList list = doc.getElementsByTagName("job");
				for (int i = 0; i < list.getLength(); i++) {
					Node node = list.item(i);
					String name = node.getNodeName();
					if (name.equals("#text")) continue;
				
					// job 태그 내부의 자식 노드들을 찾아 리스트에 담는다
					NodeList cList = node.getChildNodes();
					for (int j = 0; j < cList.getLength(); j++) {
						Node cNode = cList.item(j);
						String cName = cNode.getNodeName();
						String cTime = "";
						
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
								moditimes.add(modi_time);
							}
							if(cName.equals("expiration-timestamp")) {
								expi_time = cTime;
								System.out.println("마감일 : " + expi_time);
								expitimes.add(expi_time);
							}
							continue;
						}
						if (cName.equals("#text")) continue;

//						System.out.println("태그명 : " + cName + ", 값 : " + cNode.getTextContent());
						if(cName.equals("company")) {
							company = cNode.getTextContent();
							System.out.println("회사 : " + cNode.getTextContent());
							companies.add(company);
						}
						if(cName.equals("position")) {
							position = cNode.getTextContent();
							System.out.println("채용정보 : " + cNode.getTextContent());
							positions.add(position);
						}
					}
				}
//			}
		}
			model.addAttribute("moditimes",moditimes);
			model.addAttribute("expitimes",expitimes);
			model.addAttribute("companies",companies);
			model.addAttribute("positions",positions);
		} catch (Exception e)
		{
			e.printStackTrace();
		}		
		return "/recruiting/hireinfo";
	}
	public static void main(String [] args){
		try {
			String modi_time;
			String expi_time;
			String company;
			String position;
			String totalCnt;
			List<String> moditimes = new ArrayList<>();
			List<String> expitimes = new ArrayList<>();
			List<String> companies = new ArrayList<>();
			List<String> positions = new ArrayList<>();
			RecruitingUtil ru = new RecruitingUtil();
			
//			String postParams = "start=0&count=10";
			String postParams = "";
			for(int start=0; start<=30; start+=10) {
				System.out.println("-------------------------------" + start);
				postParams = "start="+start+"&count=10";
				URL apiUrl = new URL("http://api.saramin.co.kr/job-search?" + postParams);
//			HttpURLConnection con = (HttpURLConnection)apiUrl.openConnection();
//			con.setRequestMethod("POST");
//			con.setDoInput(true);
//			con.setDoOutput(true);
//			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
//			wr.writeUTF(postParams);
//			wr.flush();
//			wr.close();
				
//			int responseCode = con.getResponseCode();
//			if (responseCode == 200) {
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder parser = factory.newDocumentBuilder();
				Document doc = parser.parse(apiUrl.openStream());
				
				// jobs 태그내의 속성 꺼내기 
				NodeList jobs = doc.getElementsByTagName("jobs");
				for(int i=0; i<jobs.getLength(); i++) {
					Node jobsNode = jobs.item(i);
					Element jobsElement = (Element)jobsNode;
					
					String jobsEl = jobsElement.getAttribute("total");
					totalCnt=jobsEl;
					System.out.println(jobsEl);
				}
				
				// 문서 내에서 job 태그에 해당하는 Node 정보를 리스트에 담는다
				NodeList list = doc.getElementsByTagName("job");
				for (int i = 0; i < list.getLength(); i++) {
					Node node = list.item(i);
					String name = node.getNodeName();
					if (name.equals("#text")) continue;
					
					// job 태그 내부의 자식 노드들을 찾아 리스트에 담는다
					NodeList cList = node.getChildNodes();
					for (int j = 0; j < cList.getLength(); j++) {
						Node cNode = cList.item(j);
						String cName = cNode.getNodeName();
						String cTime = "";
						
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
								moditimes.add(modi_time);
							}
							if(cName.equals("expiration-timestamp")) {
								expi_time = cTime;
								System.out.println("마감일 : " + expi_time);
								expitimes.add(expi_time);
							}
							continue;
						}
						if (cName.equals("#text")) continue;
						
//						System.out.println("태그명 : " + cName + ", 값 : " + cNode.getTextContent());
						if(cName.equals("company")) {
							company = cNode.getTextContent();
							System.out.println("회사 : " + cNode.getTextContent());
							companies.add(company);
						}
						if(cName.equals("position")) {
							position = cNode.getTextContent();
							System.out.println("채용정보 : " + cNode.getTextContent());
							positions.add(position);
						}
					}
				}
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}		
	}
	
	@RequestMapping("/manageKey.do")
	public String manageKey() {
		return "/recruiting/managekey";
	}
	
	@RequestMapping("/insertKey.do")
	public String insertKey() {
		return "/recruiting/insertkey";
	}
	
	@RequestMapping("/updateKey.do")
	public String updateKey() {
		return "/recruiting/updatekey";
	}
	
}
