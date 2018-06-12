package kr.co.findme.repository.mapper;

import java.util.List;

import kr.co.findme.repository.domain.Board;
import kr.co.findme.repository.domain.Comment;

public interface BoardMapper {
	List<Board> selectBoard();
	Board selectBoardByNo(int no);
	void insertBoard(Board board);
	void updateBoard(Board board);
	void deleteBoard(int no);
	void updateBoardViewCnt(int no);
	
	// 댓글 파트
	void insertComment(Comment comment);
	List<Comment> selectCommentByNo(int findNo);
	void deleteComment(int commentNo);
	void updateComment(Comment comment);

}
