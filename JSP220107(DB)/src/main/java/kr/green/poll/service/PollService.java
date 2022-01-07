package kr.green.poll.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import kr.green.jdbc.JDBCUtil;
import kr.green.poll.dao.PollDAO;
import kr.green.poll.vo.PollVO;

public class PollService {
	//-----------------------------------------------------------------------
	// 싱글톤 패턴으로 만들자
	// 1. 자기 자신의 객체를 정적 멥버로 가진다.
	private static PollService instance = new PollService();
	// 2. 밖에서 객체를 생성하지 못하도록 생성자를 private으로 만든다.
	private PollService() {}
	// 3. 만들어져 있는 객체를 사용하도록 만든다.
	public static PollService getInstance() {
		return instance;
	}
	//-----------------------------------------------------------------------
	// 1. 목록을 얻어오는 메서드 --- 목록보기
	public List<PollVO> selectList(){
		List<PollVO> list = null;
		Connection conn = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			PollDAO dao = PollDAO.getInstance();
			//---------------------------------------------------------------
			list = dao.selectList(conn);
			//---------------------------------------------------------------
			conn.commit();
		}catch (SQLException e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		return list;
	}

	// 2. 1개 가져오기
	public PollVO selectByIdx(int idx){
		PollVO vo = null;
		Connection conn = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			PollDAO dao = PollDAO.getInstance();
			//---------------------------------------------------------------
			vo = dao.selectByIdx(conn, idx);
			//---------------------------------------------------------------
			conn.commit();
		}catch (SQLException e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
		return vo;
	}
	// 3. 투표 항목 증가시키기
	public void update(PollVO vo) {
		Connection conn = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			PollDAO dao = PollDAO.getInstance();
			//---------------------------------------------------------------
			dao.update(conn, vo);
			//---------------------------------------------------------------
			conn.commit();
		}catch (SQLException e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
	}
	// 4. 새로운 투표 저장하기
	public void insert(PollVO vo) {
		Connection conn = null;
		try {
			conn = JDBCUtil.getConnection();
			conn.setAutoCommit(false);
			PollDAO dao = PollDAO.getInstance();
			//---------------------------------------------------------------
			if(vo!=null && vo.getSubject()!=null && vo.getPollItems()!=null){
				dao.insert(conn, vo);
			}
			//---------------------------------------------------------------
			conn.commit();
		}catch (SQLException e) {
			JDBCUtil.rollback(conn);
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn);
		}
	}
}
