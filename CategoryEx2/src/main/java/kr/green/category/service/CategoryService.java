package kr.green.category.service;

import java.util.List;

import kr.green.category.vo.CategoryVO;

public interface CategoryService {
	// 새글쓰기
	void insert(CategoryVO categoryVO);
	// 답변쓰기
	void reply(CategoryVO categoryVO);
	// 항목수정
	void update(CategoryVO categoryVO);
	// 항목 삭제
	void delete(CategoryVO categoryVO);
	// 목록보기
	List<CategoryVO> selectList();
}
