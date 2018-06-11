package kr.co.findme.studyroom.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.findme.repository.domain.Link;
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
	public List<Video> deleteVideo(Video video) {
		studyRoomService.deleteVideo(video);
		List<Video> vList = studyRoomService.retrieveVideo(video.getId());
		return vList;
	}

	@RequestMapping("/link.do")
	public String link() {
		return "studyroom/link/link";
	}
	
	@RequestMapping("/linkList.json")
	@ResponseBody
	public List<Link> retrieveLink(HttpSession session, String id){
		String loginId = (String) session.getAttribute("id");
		List<Link> linkList = studyRoomService.retrieveLink(loginId);
		return linkList;
	}
	
	@RequestMapping("/linkInsert.json")
	@ResponseBody
	public List<Link> registLink(Link link) {
		studyRoomService.registLink(link);
		List<Link> linkList = studyRoomService.retrieveLink(link.getId());
		return linkList;
	}
	
	@RequestMapping("/linkUpdateForm.json")
	@ResponseBody
	public List<Link> updateFormLink(Link link) {
		System.out.println("no : " + link.getNo());
		System.out.println("id : " + link.getId());
		List<Link> linkFormList = studyRoomService.updateFormLink(link);
		return linkFormList;
	}
	
	@RequestMapping("/linkUpdate.json")
	@ResponseBody
	public List<Link> updateLink(Link link) {
		studyRoomService.updateLink(link); 
		List<Link> linkList = studyRoomService.retrieveLink(link.getId());
		return linkList;
	}
	
	@RequestMapping("/linkDelete.json")
	@ResponseBody
	public List<Link> deleteLink(Link link) {
		studyRoomService.deleteLink(link);
		List<Link> linkList = studyRoomService.retrieveLink(link.getId());
		return linkList;
	}
}
