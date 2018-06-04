package kr.co.findme.recruiting.controller;

import java.io.DataOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Controller
@RequestMapping("/recruiting")
public class RecruitingController {
	@RequestMapping("/hireInfo.do")
	public String main() {
		return "/recruiting/hireinfo";
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
