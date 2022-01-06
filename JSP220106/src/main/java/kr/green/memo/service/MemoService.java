package kr.green.memo.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import kr.green.jdbc.DBCPUtil;
import kr.green.memo.dao.MemoDAO;
import kr.green.memo.vo.MemoVO;

/*
 1. 로직 1개당 1개의 메서드로 만들어라
 2. 싱글톤으로 만들어라
 3. 메서드 내에서 트랜젝션을 처리해라!
 */
public class MemoService {

	//--------------------------------------------------------------------------
	// 싱글톤 클래스로 만들자
	// 1) 자기 자신의 객체를 정적멤버로 가진다.
	private static MemoService instance = new MemoService();
	// 2) 밖에서 객체를 생성하지 못하도록 생성자를 private로 만든다.
	private MemoService() {}
	// 3) 만들어진 객체를 가져다 쓸 수 있도록 메서드 1개를 추가한다. getInstance()
	public static MemoService getInstance() {
		return instance;
	}
	//--------------------------------------------------------------------------
	// 1. 저장하기
	public int insert(MemoVO vo) {
		int count = 0;
		Connection conn = null;
		try {
			conn = DBCPUtil.getConnection();
			conn.setAutoCommit(false);
			//--------------------------------------------------------------------
			// 이 부분만 바뀐다
			if(vo.getName()!=null && vo.getName().trim().length()>0) { // 이름이 존재할때만 
				if(vo.getPassword()!=null && vo.getPassword().trim().length()>0) { // 비번이 존재할때만 
					if(vo.getContent()!=null && vo.getContent().trim().length()>0) { // 내용이 존재할때만
						// 모든 내용이 입력이 되었다면 DB에 저장하자
						count = MemoDAO.getInstance().insert(conn, vo);
					}
				}
			}
			//--------------------------------------------------------------------
			conn.commit();
		}catch (SQLException e) {
			DBCPUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			DBCPUtil.close(conn);
		}
		return count;
	}
	
	// 2. 수정하기
	public int update(MemoVO vo) {
		int count = 0;
		Connection conn = null;
		try {
			conn = DBCPUtil.getConnection();
			conn.setAutoCommit(false);
			//--------------------------------------------------------------------
			// 이 부분만 바뀐다
			// DB에 저장된 비번하고 입력된 비번이 같을때 만 수정한다.
			if(vo!=null && vo.getIdx()>0) { // 넘어온 글의 번호가 있다면
				// 1. DB에서 글을 가져온다.
				MemoVO dbVO = MemoDAO.getInstance().selectByIdx(conn, vo.getIdx());
				// 2. DB의 비번과 이렵한 비번이 같을때만 수정해야 한다.
				if(dbVO!=null && dbVO.getPassword().equals(vo.getPassword())) {
					count = MemoDAO.getInstance().update(conn, vo);
				}
			}
			//--------------------------------------------------------------------
			conn.commit();
		}catch (SQLException e) {
			DBCPUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			DBCPUtil.close(conn);
		}
		return count;
	}

	// 3. 삭제하기
	public int delete(MemoVO vo) {
		int count = 0;
		Connection conn = null;
		try {
			conn = DBCPUtil.getConnection();
			conn.setAutoCommit(false);
			//--------------------------------------------------------------------
			// 이 부분만 바뀐다
			// DB에 저장된 비번하고 입력된 비번이 같을때 만 삭제한다.
			if(vo!=null && vo.getIdx()>0) { // 넘어온 글의 번호가 있다면
				// 1. DB에서 글을 가져온다.
				MemoVO dbVO = MemoDAO.getInstance().selectByIdx(conn, vo.getIdx());
				// 2. DB의 비번과 이렵한 비번이 같을때만 삭제해야 한다.
				if(dbVO!=null && dbVO.getPassword().equals(vo.getPassword())) {
					count = MemoDAO.getInstance().delete(conn, vo.getIdx());
				}
			}
			//--------------------------------------------------------------------
			conn.commit();
		}catch (SQLException e) {
			DBCPUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			DBCPUtil.close(conn);
		}
		return count;
	}

	// 4. 목록보기
	public List<MemoVO> selectList(){
		List<MemoVO> list = null;
		Connection conn = null;
		try {
			conn = DBCPUtil.getConnection();
			conn.setAutoCommit(false);
			//--------------------------------------------------------------------
			// 이 부분만 바뀐다
			list = MemoDAO.getInstance().selectList(conn);
			//--------------------------------------------------------------------
			conn.commit();
		}catch (SQLException e) {
			DBCPUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			DBCPUtil.close(conn);
		}
		return list;
	}
	
	// 5. 1개 가져오기
	public MemoVO selectByIdx(int idx){
		MemoVO vo = null;
		Connection conn = null;
		try {
			conn = DBCPUtil.getConnection();
			conn.setAutoCommit(false);
			//--------------------------------------------------------------------
			// 이 부분만 바뀐다
			vo = MemoDAO.getInstance().selectByIdx(conn, idx);
			//--------------------------------------------------------------------
			conn.commit();
		}catch (SQLException e) {
			DBCPUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			DBCPUtil.close(conn);
		}
		return vo;
	}
}
