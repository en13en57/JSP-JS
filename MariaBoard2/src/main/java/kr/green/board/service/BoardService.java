package kr.green.board.service;


import kr.green.board.vo.BoardVO;
import kr.green.board.vo.PagingVO;

public interface BoardService {
	// 1. 목록보기
	PagingVO<BoardVO> selectList(int currentPage, int pageSize, int blockSize);
	// 2. 1개 가져오기 (내용보기, 수정, 삭제)
	BoardVO selectByIdx(int idx, boolean isHit);
	// 3. 저장
	int insert(BoardVO vo);
	// 4. 수정
	int update(BoardVO vo);
	// 5. 삭제
	int delete(BoardVO vo);
}
