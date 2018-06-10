package kr.co.findme.main.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.findme.repository.domain.BlogSearch;

@Controller
public class MainController {
	@RequestMapping("/main.do")
	public String main() {
		return "main/main";
	}
	
	// 실시간 공채 속보 랭킹
	@RequestMapping("/loadRanking.json")
	@ResponseBody
	public String loadRanking() throws Exception {
		Document doc = Jsoup.connect("http://www.saramin.co.kr/zf_user/").get();
		Elements wList = doc.select("div.list_realtime_ranking");
		String rank = "";
		for (Element e : wList) {
			rank += e.select("ol").html();
		}
		System.out.println(rank);
		return rank;
	}
	
	// 실시간 공채 속보 기준 네이버 블로그 검색
	@RequestMapping("/loadBlogSearch.json")
	@ResponseBody
	public List<BlogSearch> loadBlogSearch(String query) throws Exception {
		List<BlogSearch> list = new ArrayList<>();
		System.out.println("네이버 검색 키워드 : " + query);
		String clientId = "3SXz8axXoMc_SUQbDUf8";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "WaY1ZpDMBc";//애플리케이션 클라이언트 시크릿값";
        try {
        	String text = URLEncoder.encode(query + " 채용", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text + "&display=6"; // json 결과
//            String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            // 스트링버퍼의 JSON 파싱하기
            Object objList = JSONValue.parse(response.toString());
            JSONObject jobjList = (JSONObject)objList;
            JSONArray jArrList = (JSONArray)jobjList.get("items");
            System.out.println("items 개수 : " + jArrList.size());
//            System.out.println(jArrList.toJSONString());
            for (int i = 0; i < jArrList.size(); i++) {
            	JSONObject tmp = (JSONObject)jArrList.get(i);
            	String title = (String)tmp.get("title");
            	String link = (String)tmp.get("link");
            	String name = (String)tmp.get("bloggername");
            	BlogSearch b = new BlogSearch();
//            	System.out.println(title);
//            	System.out.println(link);
//            	System.out.println(name);
            	b.setTitle(title);
            	b.setName(name);
            	b.setLink(link);
            	list.add(b);
            }
//            System.out.println(response.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
		return list;
	}

}
