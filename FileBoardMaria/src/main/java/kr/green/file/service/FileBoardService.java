package kr.green.file.service;

import kr.green.file.vo.FileBoardVO;
import kr.green.file.vo.PagingVO;

public interface FileBoardService {
	// 1. 목록보기
	PagingVO<FileBoardVO> selectList(int currentPage, int pageSize, int blockSize);
	// 2. 저장하기
	void insert(FileBoardVO fileBoardVO);
	// 3. 내용보기
	FileBoardVO selectByIdx(int idx);
	// 4. 수정하기
	void update(FileBoardVO fileBoardVO);
	// 5. 삭제하기
	void delete(FileBoardVO fileBoardVO);
	
}
