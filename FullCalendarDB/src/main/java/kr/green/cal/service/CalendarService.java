package kr.green.cal.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.cal.dao.CalendarDAO;
import kr.green.cal.vo.CalendarVO;
import kr.green.mybatis.MybatisApp;
import lombok.extern.log4j.Log4j;

@Log4j
public class CalendarService {
	private static CalendarService instance = new CalendarService();
	private CalendarService() {;}
	public static CalendarService getInstance() {
		return instance;
	}
	//--------------------------------------------------------------
	public List<CalendarVO> selectList(){
		log.debug("selectList 호출");
		List<CalendarVO> list =null;
		CalendarDAO calendarDAO = CalendarDAO.getInstance();
		SqlSession sqlSession = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			
			list=calendarDAO.selectList(sqlSession);
			
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
		log.debug("selectList 리턴" + list);
		return list;
	}
}
