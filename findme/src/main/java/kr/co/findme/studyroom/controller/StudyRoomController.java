package kr.co.findme.studyroom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.findme.repository.domain.Video;
import kr.co.findme.studyroom.service.StudyRoomService;

@Controller
@RequestMapping("/studyroom")
public class StudyRoomController {
	
	@Autowired
	private StudyRoomService studyRoomService;
	
	@RequestMapping("/video.do")
	public String video(Model model) {
		return "studyroom/video/video";
	}
	
	@RequestMapping("/vList.json")
	@ResponseBody
	public List<Video> retrieveVideo(HttpSession session, String id){
		String loginId = (String) session.getAttribute("id");
		List<Video> vList = studyRoomService.retrieveVideo(loginId);
		System.out.println("list 개수 : " + vList.size());
		return vList;
	}
	
	@RequestMapping("/vInsert.json")
	@ResponseBody
	public List<Video> registVideo(Video video) {
		studyRoomService.registVideo(video);
		System.out.println(video.getTitle());
		System.out.println(video.getUrl());
		
		List<Video> vList = studyRoomService.retrieveVideo(video.getId());
		for (Video v : vList) {
			System.out.println("제목 : " + v.getTitle());
			System.out.println("링크 : " + v.getUrl());
		}
		
		return vList;
	}
	
	@RequestMapping("/vUpdate.json")
	@ResponseBody
	public void updateVideo(Video video) throws Exception {
		studyRoomService.updateVideo(video);  
	}
	
	@RequestMapping("/vDelete.json")
	@ResponseBody
	public void deleteVideo(Video video) throws Exception {
		studyRoomService.deleteVideo(video);  
	}

	@RequestMapping("/link.do")
	public String link() {
		return "studyroom/link/link";
	}
}
