package kr.co.findme.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.findme.repository.domain.Board;
import kr.co.findme.repository.domain.Comment;
import kr.co.findme.repository.mapper.BoardMapper;

@Service
public class BoardServiceExec implements BoardService{
	
	@Autowired
	private BoardMapper mapper;

	@Override
	public List<Board> retrieveBoard() {
		return mapper.selectBoard();
	}

	@Override
	public Board retrieveBoardByNo(int no) {
		return mapper.selectBoardByNo(no);
	}

	@Override
	public void insertBoard(Board board) {
		mapper.insertBoard(board);
	}

	@Override
	public void updateBoard(Board board) {
		mapper.updateBoard(board);
	}

	@Override
	public void deleteBoard(int no) {
		mapper.deleteBoard(no);
	}

	@Override
	public void updateBoardViewCnt(int no) {
		mapper.updateBoardViewCnt(no);
	}

	@Override
	public void insertComment(Comment comment) {
		mapper.insertComment(comment);
	}

	@Override
	public List<Comment> retrieveCommentByNo(int findNo) {
		return mapper.selectCommentByNo(findNo);
	}

	@Override
	public void deleteComment(int commentNo) {
		mapper.deleteComment(commentNo);
	}

	@Override
	public void updateComment(Comment comment) {
		mapper.updateComment(comment);
	}

	
}
