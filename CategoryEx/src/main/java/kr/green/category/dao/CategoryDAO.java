package kr.green.category.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.category.vo.CategoryVO;

public interface CategoryDAO {
	List<CategoryVO> selectList(SqlSession sqlSession);
	
	
	
	
}
