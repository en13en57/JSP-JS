package kr.green.board.service;

import java.util.List;


import kr.green.board.vo.CommentVO;

public interface CommentService {

	//	<!-- 1. 지정 번호의 댓글 몇개? -->
	int selectCount(int ref);
	
	//	<!-- 2. 지정 번호의 모든 댓글 얻기 -->
	List<CommentVO> selectList(int ref);
	
	//	<!-- 3. 댓글 저장 -->
	void insert(CommentVO commentVO);
	
	//	<!-- 4. 댓글 수정 -->
	void update(CommentVO commentVO);
	
	//	<!-- 5. 댓글 삭제 -->
	void deleteByIdx(CommentVO commentVO);

	//	<!-- 6. 지정 번호의 모든 댓글 삭제 -->
	void deleteByRef(int ref);
}
	
