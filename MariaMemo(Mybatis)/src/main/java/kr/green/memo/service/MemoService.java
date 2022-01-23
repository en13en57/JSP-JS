package kr.green.memo.service;

import kr.green.memo.vo.MemoVO;
import kr.green.memo.vo.PagingVO;

public interface MemoService {
	// 목록보기
	PagingVO<MemoVO> selectList(int currentPage, int pageSize, int blockSize);
	// 1개 보기
	MemoVO selcetByIdx(int idx);
	// 저장하기
	void insert(MemoVO memoVO);
	// 수정하기
	void update(MemoVO memoVO);
	// 삭제하기
	void delete(MemoVO memoVO);
	
}
