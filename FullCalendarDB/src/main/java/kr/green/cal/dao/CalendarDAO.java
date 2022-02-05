package kr.green.cal.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.cal.vo.CalendarVO;

public class CalendarDAO {
	private static CalendarDAO instance = new CalendarDAO();
	private CalendarDAO() {}
	public static CalendarDAO getInstance() {
		return instance;
	}
	//------------------------------------------------------
	public List<CalendarVO> selectList(SqlSession sqlSession){
		return sqlSession.selectList("calendar.selectList");
	}
	
	public void updateDrop(SqlSession sqlSession, HashMap<String, String> map) {
		sqlSession.update("calendar.updateDrop", map);
	}

	public void insert(SqlSession sqlSession, CalendarVO vo) {
		sqlSession.insert("calendar.insert", vo);
	}
}
