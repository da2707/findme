package kr.co.findme.board.service;

import java.util.List;

import kr.co.findme.repository.domain.Board;
import kr.co.findme.repository.domain.Comment;

public interface BoardService {
	public List<Board> retrieveBoard();
	public Board retrieveBoardByNo(int no);
	public void insertBoard(Board board);
	public void updateBoard(Board board);
	public void deleteBoard(int no);
	public void updateBoardViewCnt(int no);
	
	// 댓글 파트
	void insertComment(Comment comment);
	List<Comment> retrieveCommentByNo(int findNo);
	void deleteComment(int commentNo);
	void updateComment(Comment comment);
}
