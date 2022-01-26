package kr.green.file.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import kr.green.file.vo.FileBoardVO;
public interface FileBoardDAO {
	// <!-- 1. 전체 개수 세기 -->
	int selectCount(SqlSession sqlSession) throws SQLException;
	// <!-- 2. 1개 얻기 -->
	FileBoardVO selectByIdx(SqlSession sqlSession, int idx) throws SQLException;
	// <!-- 3. 1페이지 얻기 -->
	List<FileBoardVO> selectList(SqlSession sqlSession,HashMap<String, Integer> map) throws SQLException;
	// <!-- 4. 저장 -->
	void insert(SqlSession sqlSession, FileBoardVO fileBoardVO) throws SQLException;
	// <!-- 5. 수정 -->
	void update(SqlSession sqlSession, FileBoardVO fileBoardVO) throws SQLException;
	// <!-- 6. 삭제 -->
	void delete(SqlSession sqlSession, int idx) throws SQLException;
	// <!-- 7. 마지막에 저장한 글의 idx를 읽어오는 쿼리 -->
	int selectMaxIdx(SqlSession sqlSession) throws SQLException;
}
