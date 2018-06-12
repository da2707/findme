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
	
	@RequestMapping("/signup.do")
	public String signup(User user, Model model) throws Exception {
		User insertUser = new User();
		insertUser.setId(user.getId());
		insertUser.setPw(user.getPw());
		insertUser.setName(user.getName());
		insertUser.setEmail(user.getEmail());
		userService.insertUser(insertUser);
		
		
		return "/user/signup";
		
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

/*

@RequestMapping(value = "/user/edit", method = RequestMethod.POST)
public String submit(@ModelAttribute User user, SessionStatus sessionStatus) {
    userService.updateUser(user);
    sessionStatus.setComplete();
    return "user/editsuccess";

 */

