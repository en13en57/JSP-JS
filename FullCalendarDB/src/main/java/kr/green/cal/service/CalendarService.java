package kr.green.cal.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.cal.dao.CalendarDAO;
import kr.green.cal.vo.CalendarVO;
import kr.green.mybatis.MybatisApp;
import lombok.extern.log4j.Log4j;

@Log4j
public class CalendarService {
	private static CalendarService instance = new CalendarService();
	private CalendarService() {}
	public static CalendarService getInstance() {
		return instance;
	}
	//------------------------------------------------------
	public List<CalendarVO> selectList(){
		log.debug("selectList 호출~~~~~");
		List<CalendarVO> list = null;
		CalendarDAO calendarDAO = CalendarDAO.getInstance();
		SqlSession sqlSession = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);

			list = calendarDAO.selectList(sqlSession);
			
			sqlSession.commit();
		}catch(Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		log.debug("selectList 리턴 : " + list);
		return list;
	}
	
	public void updateDrop(int id, String start1, String end1 ) {
		log.debug("updateDrop 호출~~~~~ : " + id + ", " + start1 + ", " + end1);
		CalendarDAO calendarDAO = CalendarDAO.getInstance();
		SqlSession sqlSession = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);

			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", id+"");
			map.put("start1", start1);
			map.put("end1", end1);
			
			calendarDAO.updateDrop(sqlSession, map);
			
			sqlSession.commit();
		}catch(Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		log.debug("updateDrop 리턴 : ");
	}
	
	public void insert(CalendarVO vo) {
		log.debug("insert 호출~~~~~ : " + vo);
		CalendarDAO calendarDAO = CalendarDAO.getInstance();
		SqlSession sqlSession = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			
			// 데이터를 SQL에서 에러가 나오지 않도록 모양을 모두 변경하고 DAO의 insert를 호출하면 된다.
			// start와 end를 가공해줘야 한다.
			// 2022-01-01 11:12:13
			if(vo.isAllday()) {
				vo.setStart(vo.getStart().substring(0,10) + " 00:00:00");
				vo.setEnd(vo.getEnd().substring(0,10) + " 00:00:00");
			}else {
				vo.setStart(vo.getStart().substring(0,15) + ":00");
				vo.setEnd(vo.getStart().substring(0,15) + ":00");
			}
			
			// VO에 필드 하나를 추가해서 참인경우 1을 거짓인경우 0을 넣어주자.
			vo.setAllDays(vo.isAllday() ? 1 : 0);
			
			
			calendarDAO.insert(sqlSession, vo);
			
			sqlSession.commit();
		}catch(Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		log.debug("insert 리턴 : ");
	}
	
	
}
