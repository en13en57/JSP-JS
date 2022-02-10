package kr.green.board.service;

import kr.green.board.vo.BoardVO;
import kr.green.board.vo.PagingVO;

public interface BoardService {
	// 리스트 보기
	PagingVO<BoardVO> selectList(int currentPage, int pageSize, int blockSize );
	// 한개 보기
	BoardVO selectByIdx(int idx, int mode);
	// 저장
	void insert(BoardVO boardVO);
	// 수정
	void update(BoardVO boardVO);
	// 삭제
	void delete(BoardVO boardVO);
}
