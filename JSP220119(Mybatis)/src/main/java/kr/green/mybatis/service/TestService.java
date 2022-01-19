package kr.green.mybatis.service;

import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import kr.green.mybatis.dao.TestDAO;
import kr.green.mybatis.jdbc.MybatisApp;
import kr.green.mybatis.vo.TestVO;
import lombok.extern.log4j.Log4j;

@Log4j
public class TestService {
	private static TestService instance = new TestService();
	private TestService() {;}
	public static TestService getInstance() {
		return instance;
	}
	//-------------------------------------------------
	// 로직 1개당 메서드 1개
	public Date selectToday() {
		log.debug("selectToday() 호출");
		Date date = null;
		//----------------------------------------------
		SqlSession sqlSession = null;
		TestDAO dao = TestDAO.getInstance();
		try{
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			//----------------------------------------------------------------
			date = dao.selectToday(sqlSession);
			//----------------------------------------------------------------
			sqlSession.commit();
			}catch(Exception e){
				sqlSession.rollback();
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		//----------------------------------------------
		log.debug("selectToday() 리턴 : " + date);
		return date;
	}

	public int selectCalc(int num1, int num2, int num3) {
		log.debug("selectCalc() 호출 : " + num1 + ", " + num2 + ", " + num3);
		 int result = 0;
		//----------------------------------------------
		SqlSession sqlSession = null;
		TestDAO dao = TestDAO.getInstance();
		try{
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			//----------------------------------------------------------------
			HashMap<String, Integer> map = new HashMap<>();
			map.put("num1", num1);
			map.put("num2", num2);
			map.put("num3", num3);
			result = dao.selectCalc(sqlSession, map);
			//----------------------------------------------------------------
			sqlSession.commit();
		}catch(Exception e){
			sqlSession.rollback();
			e.printStackTrace();	
		}finally{
			sqlSession.close();
		}
		//----------------------------------------------
		log.debug("selectCalc() 리턴 : " + result);
		return result;
	}

	public TestVO selectVO(int num1, int num2, int num3) {
		log.debug("selectVO() 호출 : " + num1 + ", " + num2 + ", " + num3);
		TestVO vo = null;
		//----------------------------------------------
		SqlSession sqlSession = null;
		TestDAO dao = TestDAO.getInstance();
		try{
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			//----------------------------------------------------------------
			HashMap<String, Integer> map = new HashMap<>();
			map.put("num1", num1);
			map.put("num2", num2);
			map.put("num3", num3);
			vo = dao.selectVO(sqlSession, map);
			//----------------------------------------------------------------
			sqlSession.commit();
		}catch(Exception e){
			sqlSession.rollback();
			e.printStackTrace();	
		}finally{
			sqlSession.close();
		}
		//----------------------------------------------
		log.debug("selectVO() 리턴 : " + vo);
		return vo;
	}
	
	public HashMap<String, Object> selectMap(int num1, int num2, int num3) {
		log.debug("selectMap() 호출 : " + num1 + ", " + num2 + ", " + num3);
		HashMap<String, Object> resultMap = null;
		//----------------------------------------------
		SqlSession sqlSession = null;
		TestDAO dao = TestDAO.getInstance();
		try{
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			//----------------------------------------------------------------
			HashMap<String, Integer> map = new HashMap<>();
			map.put("num1", num1);
			map.put("num2", num2);
			map.put("num3", num3);
			resultMap = dao.selectMap(sqlSession, map);
			//----------------------------------------------------------------
			sqlSession.commit();
		}catch(Exception e){
			sqlSession.rollback();
			e.printStackTrace();	
		}finally{
			sqlSession.close();
		}
		//----------------------------------------------
		log.debug("selectMap() 리턴 : " + resultMap);
		return resultMap;
	}
	
	
}
