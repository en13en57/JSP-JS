package kr.green.file.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.file.dao.BoardFileDAO;
import kr.green.file.dao.BoardFileDAOImpl;
import kr.green.file.dao.FileBoardDAO;
import kr.green.file.dao.FileBoardDAOImpl;
import kr.green.file.mybatis.MybatisApp;
import kr.green.file.vo.BoardFileVO;
import kr.green.file.vo.FileBoardVO;
import kr.green.file.vo.PagingVO;
import lombok.extern.log4j.Log4j;

@Log4j
public class FileBoardServiceImpl implements FileBoardService {
	private static FileBoardService instance = new FileBoardServiceImpl();
	private FileBoardServiceImpl() {;}
	public static FileBoardService getInstance() {
		return instance;
	}
	@Override
	public PagingVO<FileBoardVO> selectList(int currentPage, int pageSize, int blockSize) {
		log.debug("selectList 호출 : " + currentPage + pageSize + blockSize);
		PagingVO<FileBoardVO> pagingVO = null;
		SqlSession sqlSession = null;
		FileBoardDAO fileBoardDAO = null;
		BoardFileDAO boardFileDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			fileBoardDAO = FileBoardDAOImpl.getInstance();
			boardFileDAO = BoardFileDAOImpl.getInstance();
			//---------------------------------------------------------------------------------
			// 1. 전체 개수 구하기
			int totalCount = fileBoardDAO.selectCount(sqlSession);
			// 2. 페이징 계산
			pagingVO = new PagingVO<FileBoardVO>(totalCount, currentPage, pageSize, blockSize);
			// 3. 글 목록 가져오기
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNo", pagingVO.getStartNo());
			map.put("pageSize", pagingVO.getPageSize());
			List<FileBoardVO> list = fileBoardDAO.selectList(sqlSession, map);
			// 4. 각각의 글에 첨부 파일 정보를 추가
			if(list!=null) {
				for(FileBoardVO vo : list) {
					// 해당 글의 첨부 파일 정보 얻기
					List<BoardFileVO> fileList = boardFileDAO.selectByRef(sqlSession, vo.getIdx());
					// vo에 넣자
					vo.setFileList(fileList);
					
				}
				// 5. 리스트를 pagingVO에 넣어준다.
				pagingVO.setList(list); 
			}
			//---------------------------------------------------------------------------------
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		log.debug("selectList 리턴 : " + pagingVO);
		return pagingVO;
	}
	
	@Override
	public void insert(FileBoardVO fileBoardVO) {
		log.debug("insert 호출 : " + fileBoardVO);
		SqlSession sqlSession = null;
		FileBoardDAO fileBoardDAO = null;
		BoardFileDAO boardFileDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			fileBoardDAO = FileBoardDAOImpl.getInstance();
			boardFileDAO = BoardFileDAOImpl.getInstance();
			//---------------------------------------------------------------------------------
			
			
			
			
			
			
			//---------------------------------------------------------------------------------
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		log.debug("insert 리턴 : ");
	}
	
	@Override
	public FileBoardVO selectByIdx(int idx) {
		log.debug("selectByIdx 호출 : " + idx);
		FileBoardVO fileBoardVO = null;
		SqlSession sqlSession = null;
		FileBoardDAO fileBoardDAO = null;
		BoardFileDAO boardFileDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			fileBoardDAO = FileBoardDAOImpl.getInstance();
			boardFileDAO = BoardFileDAOImpl.getInstance();
			//---------------------------------------------------------------------------------
			
			
			
			
			
			
			//---------------------------------------------------------------------------------
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		log.debug("selectByIdx 리턴 : " + fileBoardVO);
		return fileBoardVO;
	}
	
	@Override
	public void update(FileBoardVO fileBoardVO) {
		log.debug("update 호출 : " + fileBoardVO);
		SqlSession sqlSession = null;
		FileBoardDAO fileBoardDAO = null;
		BoardFileDAO boardFileDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			fileBoardDAO = FileBoardDAOImpl.getInstance();
			boardFileDAO = BoardFileDAOImpl.getInstance();
			//---------------------------------------------------------------------------------
			
			
			
			
			
			
			//---------------------------------------------------------------------------------
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		log.debug("update 리턴 : ");
		
	}
	
	@Override
	public void delete(FileBoardVO fileBoardVO) {
		log.debug("delete 호출 : " + fileBoardVO);
		SqlSession sqlSession = null;
		FileBoardDAO fileBoardDAO = null;
		BoardFileDAO boardFileDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			fileBoardDAO = FileBoardDAOImpl.getInstance();
			boardFileDAO = BoardFileDAOImpl.getInstance();
			//---------------------------------------------------------------------------------
			
			
			
			
			
			
			//---------------------------------------------------------------------------------
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		log.debug("delete 리턴 : ");
		
	}
}
