package kr.green.file.service;

import kr.green.file.vo.FileBoardVO;
import kr.green.file.vo.PagingVO;

public interface FileBoardService {
	// 목록보기
	PagingVO<FileBoardVO> selectList(int currentPage, int pageSize, int blockSize);
	// 저장하기
	void insert(FileBoardVO fileBoardVO);
	// 내용보기
	FileBoardVO selectByIdx(int idx);
	// 수정하기
	void update(FileBoardVO fileBoardVO, String path, String[] delfile);
	// 삭제하기
	void delete(FileBoardVO fileBoardVO, String path);
	
}
