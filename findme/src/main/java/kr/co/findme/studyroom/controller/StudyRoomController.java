package kr.co.findme.studyroom.controller;

import java.util.List;

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
		List<Video> vList = studyRoomService.retrieveVideo("id1");
		model.addAttribute("vList",vList);
		System.out.println(vList.size());
		return "studyroom/video/video";
	}
	
//	@RequestMapping("/vList.do")
//	public List<Video> retrieveVideo() throws Exception {
//	}
	
	@RequestMapping("/vInsert.json")
	@ResponseBody
	public void registVideo(Video video) {
		studyRoomService.registVideo(video);  
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
