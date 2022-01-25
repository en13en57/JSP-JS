package kr.green.file.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.file.vo.BoardFileVO;

public interface BoardFileDAO {
	// <!-- 1. 해당 ref의 첨부파일 목록 가져오기 -->
	List<BoardFileVO> selectByRef(SqlSession sqlSession, int ref) throws SQLException;
	// <!-- 2. 저장 -->
	void insert(SqlSession sqlSession, BoardFileVO boardFileVO) throws SQLException;
	// <!-- 3. 삭제 -->
	void delete(SqlSession sqlSession, int idx) throws SQLException;
	
	
}
