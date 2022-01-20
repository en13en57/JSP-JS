package kr.green.board.service;

import kr.green.board.vo.BoardVO;
import kr.green.board.vo.CommentVO;
import kr.green.board.vo.PagingVO;

public interface BoardService {
	// 1. 목록보기
	PagingVO<BoardVO> selectList(int currentPage, int pageSize, int blockSize);
	// 2. 내용보기 -- 댓글목록
	BoardVO selectByIdx(int idx, boolean isHit);
	// 3. 저장하기
	void insert(BoardVO boardVO);
	// 4. 수정하기
	void update(BoardVO boardVO);
	// 5. 삭제하기
	void delete(BoardVO boardVO);
	// 6. 댓글 쓰기
	void commentInsert(CommentVO commentVO);
	// 7. 댓글 수정
	void commentUpdate(CommentVO commentVO);
	// 8. 댓글 삭제
	void commentDelete(CommentVO commentVO);
}
