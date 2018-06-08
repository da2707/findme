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
		return vList;
	}
	
	@RequestMapping("/vInsert.json")
	@ResponseBody
	public List<Video> registVideo(Video video) {
		studyRoomService.registVideo(video);
		List<Video> vList = studyRoomService.retrieveVideo(video.getId());
		return vList;
	}
	
	@RequestMapping("/vUpdateForm.json")
	@ResponseBody
	public List<Video> updateFormVideo(Video video) {
		System.out.println("no : " + video.getNo());
		System.out.println("id : " + video.getId());
		List<Video> vFormList = studyRoomService.updateFormVideo(video);
		return vFormList;
	}

	@RequestMapping("/vUpdate.json")
	@ResponseBody
	public List<Video> updateVideo(Video video) {
		studyRoomService.updateVideo(video); 
		List<Video> vList = studyRoomService.retrieveVideo(video.getId());
		return vList;
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
