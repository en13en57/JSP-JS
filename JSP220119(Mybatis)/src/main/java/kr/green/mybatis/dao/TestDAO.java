package kr.green.mybatis.dao;
// 맵퍼의 태그 하나당 1개의 메서드를 만든다.
// 첫번째 인수는 SqlSession이다.

import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import kr.green.mybatis.vo.TestVO;

public class TestDAO {
	private static TestDAO instance = new TestDAO();
	private TestDAO() {;}
	public static TestDAO getInstance() {
		return instance;
	}
	//-------------------------------------------------
	// 맵퍼의 태그가 4개니까 메서드도 4개다.
	public Date selectToday(SqlSession sqlSession) {
		return sqlSession.selectOne("test.today");
	}
	
	public int selectCalc(SqlSession sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("test.calc", map);
	}
	
	public TestVO selectVO(SqlSession sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("test.vo1", map);
	}

	public HashMap<String, Object> selectMap(SqlSession sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("test.vo2", map);
	}
	
	
	
	
	
	
}
