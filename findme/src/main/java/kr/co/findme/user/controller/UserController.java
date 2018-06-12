package kr.co.findme.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

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
	public String loginPOST(User user, Model model) throws Exception{
		User loginUser = userService.login(user.getId()); 
		// loginUser 에는  유저의 모든 값이 다 들어가있다.
		
		String msg = "";
		
		if (loginUser == null) {
			msg = "아이디가 잘못되었습니다.";
		} else if(!loginUser.getPw().equals(user.getPw())) {
			msg = "비밀번호가 잘못되었습니다.";
		} else {
			System.out.println(loginUser);
			model.addAttribute("user", loginUser);
			model.addAttribute("id", loginUser.getId());
			// id 는 위에서 설정했기때문에 session에 올라간다.
			return "/main.do";
		}
		return msg;
	}
	
	@RequestMapping("/signupForm.do")
	public String signupForm(User user) throws Exception {
		return "/user/signupForm";
	}
	
	@RequestMapping("signup.do")
	public String signup(User user) throws Exception {
		userService.insertUser(user);
		return "redirect:/main.do";
	}
	
	@RequestMapping("/idCheck.json")
	@ResponseBody
	public int countid(String id) throws Exception {
		int no = userService.countId(id);
		return no;
	}
	
	@RequestMapping("/mypage.do")
	public String myPage() throws Exception {
		return "/user/mypage";
	}
	
	@RequestMapping("/logout.do")
	public String logout(SessionStatus status) throws Exception{
		status.setComplete();
		return "redirect:/main.do";
	}
}


