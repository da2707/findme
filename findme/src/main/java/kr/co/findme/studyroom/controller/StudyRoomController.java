package kr.co.findme.studyroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/studyroom")
public class StudyRoomController {
	@RequestMapping("/video.do")
	public String video() {
		return "/studyroom/video/video";
	}

	@RequestMapping("/link.do")
	public String link() {
		return "/studyroom/link/link";
	}
}
