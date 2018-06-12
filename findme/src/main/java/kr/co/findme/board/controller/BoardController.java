package kr.co.findme.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.findme.board.service.BoardService;
import kr.co.findme.repository.domain.Board;
import kr.co.findme.repository.domain.Comment;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/list.do")
	public String listAll(Board board, Model model) throws Exception {
		List<Board> listAll = service.retrieveBoard();
		model.addAttribute("list", listAll);
		return "/board/list";
	}
	
	@RequestMapping("/detail.do")
	public String detail(int no, Model model) throws Exception {
		Board board = service.retrieveBoardByNo(no);
		model.addAttribute("board", board);
		service.updateBoardViewCnt(no);
		return "/board/detail";
	}
	
	@RequestMapping("/commentList.json")
	@ResponseBody
	public List<Comment> commentList(int no) throws Exception {
		List<Comment> comment = service.retrieveCommentByNo(no);
		return comment;
	}
	
	@RequestMapping("/commentRegist.json")
	@ResponseBody
	public List<Comment> commentRegist(Comment comment) throws Exception {
		service.insertComment(comment);
		List<Comment> c = service.retrieveCommentByNo(comment.getNo());
		return c;
	}
	
	@RequestMapping("/commentUpdate.json")
	@ResponseBody
	public List<Comment> commentUpdate(Comment comment) throws Exception {
		service.updateComment(comment);
		List<Comment> c = service.retrieveCommentByNo(comment.getNo());
		return c;
	}
	
	@RequestMapping("/commentDelete.json")
	@ResponseBody
	public List<Comment> commentDelete(Comment comment) throws Exception {
		service.deleteComment(comment.getCmtNo());
		List<Comment> c = service.retrieveCommentByNo(comment.getNo());
		return c;
	}
	
	@RequestMapping("/write.do")
	public String write(Board board) throws Exception {
		service.insertBoard(board);
		int no = board.getNo();
		return "redirect:/board/detail.do?no=" + no;
	}
	
	@RequestMapping("/writeForm.do")
	public String writeForm() throws Exception {
		return "/board/writeForm";
	}
	
	@RequestMapping("/updateForm.do")
	public String updateForm(int no, Model model) throws Exception {
		Board board = service.retrieveBoardByNo(no);
		model.addAttribute("board", board);
		return "/board/updateForm";
	}
	
	@RequestMapping("/update.do")
	public String update(Board board) throws Exception {
		service.updateBoard(board);
		int no = board.getNo();
		return "redirect:/board/detail.do?no=" + no;
	}
	
	@RequestMapping("/delete.do")
	public String delete(int no) throws Exception {
		service.deleteBoard(no);
		return "redirect:/board/list.do";
	}
	
	
	
	

	
	
}


/*
@RequestMapping("/board/list.do")
public ModelAndView list() {
	List<Board> list = mapper.selectBoard();
	ModelAndView mav = new ModelAndView("/jsp/board/list.jsp");
	mav.addObject("list", list);
	return mav;
}

@RequestMapping("/list.json")
@ResponseBody
public List<Schedule> list(String userId) throws Exception {
	List<Schedule> list = scheduleService.retrieveList(userId);
	return list;
}	

*/










