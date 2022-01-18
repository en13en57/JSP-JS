package kr.green.memo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.green.memo.vo.MemoVO;
import lombok.extern.log4j.Log4j;

@Log4j
public class MemoDAO {
	//---------------------------------------------------------
	// 싱글톤 클래스로 만들자
	private static MemoDAO instance = new MemoDAO();
	private MemoDAO() {}
	public static MemoDAO getInstance() {
		return instance;
	}
	//---------------------------------------------------------
	// 1. SQL명령어 1개당 1개의 메서드로 만든다.
	// 2. 첫번째 인수는 무조건 SqlMapClient이다. 왜? 트랜젝션 처리를 위해서!!!
	
	// 1) 전체 개수 세기를 위한 메서드 -- 목록보기에서 페이지 계산에 필요
	public int selectCount(SqlMapClient mapClient) throws SQLException {
		return (Integer)mapClient.queryForObject("memo.selectCount");
	}
	
	// 2) 한페이지 분량의 글을 얻어오는 메서드 -- 1페이지 목록 출력에 필요
	public List<MemoVO> selectList(SqlMapClient mapClient, HashMap<String, Integer> map) throws SQLException{
		return mapClient.queryForList("memo.selectList", map);
	}
	
	// 3) 1개의 글을 읽어오는 메서드 -- 수정/삭제에 필요
	public MemoVO selectByIdx(SqlMapClient mapClient, int idx) throws SQLException {
		return (MemoVO)mapClient.queryForObject("memo.selectByIdx", idx);
	}
	// 4) 1개의 글을 저장하는 메서드
	public void insert(SqlMapClient mapClient, MemoVO vo) throws SQLException {
		mapClient.insert("memo.insert", vo);
	}

	// 5) 1개의 글을 수정하는 메서드
	public void update(SqlMapClient mapClient, MemoVO vo) throws SQLException {
		mapClient.update("memo.update", vo);
	}
	
	// 6) 1개의 글을 삭제하는 메서드
	public void delete(SqlMapClient mapClient,  int idx) throws SQLException {
		mapClient.delete("memo.delete", idx);
	}
	
}
