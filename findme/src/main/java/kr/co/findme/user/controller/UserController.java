package kr.co.findme.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.findme.repository.domain.User;
import kr.co.findme.user.service.UserService;

@Controller
@RequestMapping("/user")
@SessionAttributes("id")
public class UserController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/loginPost.json")
	@ResponseBody
	public String loginPOST(String id, String pw, Model model) throws Exception{
		User user = userService.loginSuccess(id);
		
		String msg = "";
		
		if (user == null) {
			msg = "아이디가 잘못되었습니다.";
		} else if(!user.getPw().equals(pw)) {
			msg = "비밀번호가 잘못되었습니다.";
		} else {
			System.out.println(user);
			msg = "로그인 성공";
			model.addAttribute("user", user);
			model.addAttribute("id", id);
			
			return "/main.do";
		}
		return msg;
	}
	
	@RequestMapping("/signup.do")
	public String signup() throws Exception {
		
		return "/user/signup";
		
	}
}


