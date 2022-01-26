package kr.green.file.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.file.dao.BoardFileDAO;
import kr.green.file.dao.BoardFileDAOImpl;
import kr.green.file.dao.FileBoardDAO;
import kr.green.file.dao.FileBoardDAOImpl;
import kr.green.file.vo.BoardFileVO;
import kr.green.file.vo.FileBoardVO;
import kr.green.file.vo.PagingVO;
import kr.green.mybatis.MybatisApp;
import lombok.extern.log4j.Log4j;

@Log4j
public class FileBoardServiceImpl implements FileBoardService {
	private static FileBoardService instance = new FileBoardServiceImpl();
	private FileBoardServiceImpl() {}
	public static FileBoardService getInstance() {
		return instance;
	}
	//----------------------------------------------------------------------
	@Override
	public PagingVO<FileBoardVO> selectList(int currentPage, int pageSize, int blockSize) {
		log.debug("selectList 호출 : " + currentPage + ", " + pageSize + ", " + blockSize);
		PagingVO<FileBoardVO> pagingVO = null;
		//------------------------------------------------------------------------
		SqlSession sqlSession = null;
		FileBoardDAO fileBoardDAO = null;
		BoardFileDAO boardFileDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			fileBoardDAO = FileBoardDAOImpl.getInstance();
			boardFileDAO = BoardFileDAOImpl.getInstance();
			//------------------------------------------------------------------------
			// 1. 전체 개수 구하기
			int totalCount = fileBoardDAO.selectCount(sqlSession);
			// 2. 페이지 계산
			pagingVO = new PagingVO<FileBoardVO>(totalCount, currentPage, pageSize, blockSize);
			// 3. 글목록 가져오기
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNo", pagingVO.getStartNo());
			map.put("pageSize", pagingVO.getPageSize());
			List<FileBoardVO> list = fileBoardDAO.selectList(sqlSession, map);
			// 4. 각각의 글에 첨부 파일 정보를 추가한다.
			if(list!=null) {
				for(FileBoardVO vo : list) {
					// 해당글의 첨부파일 정보 얻기
					List<BoardFileVO> fileList = boardFileDAO.selectByRef(sqlSession, vo.getIdx());
					// vo에 넣자
					vo.setFileList(fileList);
				}
				// 5. 리스트를 pagingVO에 넣자
				pagingVO.setList(list);
			}
			//------------------------------------------------------------------------
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		//------------------------------------------------------------------------
		log.debug("selectList 리턴 : " + pagingVO);
		return pagingVO;
	}
	@Override
	public void insert(FileBoardVO fileBoardVO) {
		log.debug("insert 호출 : " + fileBoardVO);
		//------------------------------------------------------------------------
		SqlSession sqlSession = null;
		FileBoardDAO fileBoardDAO = null;
		BoardFileDAO boardFileDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			fileBoardDAO = FileBoardDAOImpl.getInstance();
			boardFileDAO = BoardFileDAOImpl.getInstance();
			//------------------------------------------------------------------------
			// 1) 넘어온 객체가 존재한다면
			if(fileBoardVO!=null) {
				// 2) 원본글을 저장하고
				fileBoardDAO.insert(sqlSession, fileBoardVO);
				// 3) 원본글의 idx를 알아내고
				int ref = fileBoardDAO.selectMaxIdx(sqlSession);
				// 4) 파일 정보를 저장한다.
				if(fileBoardVO.getFileList()!=null) {
					for(BoardFileVO boardFileVO : fileBoardVO.getFileList()) {
						boardFileVO.setRef(ref);
						boardFileDAO.insert(sqlSession, boardFileVO);
					}
				}
			}
			//------------------------------------------------------------------------
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		//------------------------------------------------------------------------
		log.debug("insert 리턴 : ");
	}
	@Override
	public FileBoardVO selectByIdx(int idx) {
		log.debug("selectByIdx 호출 : " + idx);
		FileBoardVO fileBoardVO = null;
		//------------------------------------------------------------------------
		SqlSession sqlSession = null;
		FileBoardDAO fileBoardDAO = null;
		BoardFileDAO boardFileDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			fileBoardDAO = FileBoardDAOImpl.getInstance();
			boardFileDAO = BoardFileDAOImpl.getInstance();
			//------------------------------------------------------------------------
			// 1) 해당 글번호의 글을 읽어온다
			fileBoardVO = fileBoardDAO.selectByIdx(sqlSession, idx);
			// 2) 해당글이 존재한다면 첨부파일의 목록을 가져온다.
			if(fileBoardVO!=null) {
				fileBoardVO.setFileList(boardFileDAO.selectByRef(sqlSession, fileBoardVO.getIdx()));
			}
			//------------------------------------------------------------------------
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		//------------------------------------------------------------------------
		log.debug("selectByIdx 리턴 : " + fileBoardVO);
		return fileBoardVO;
	}
	@Override
	public void update(FileBoardVO fileBoardVO, String path, String[] delfile) {
		log.debug("update 호출 : " + fileBoardVO);
		//------------------------------------------------------------------------
		SqlSession sqlSession = null;
		FileBoardDAO fileBoardDAO = null;
		BoardFileDAO boardFileDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			fileBoardDAO = FileBoardDAOImpl.getInstance();
			boardFileDAO = BoardFileDAOImpl.getInstance();
			//------------------------------------------------------------------------
			// 1) DB에서 해당 글번호의 글을 읽어온다.
			FileBoardVO dbVO = selectByIdx(fileBoardVO.getIdx());
			// 2) 비번이 같으면 수정한다.
			if(dbVO!=null && dbVO.getPassword().equals(fileBoardVO.getPassword())) {
				fileBoardDAO.update(sqlSession, fileBoardVO); // 원본글 수정
				// 3) 첨부파일이 있으면 첨부 파일 추가한다. 
				if(fileBoardVO.getFileList()!=null) {
					for(BoardFileVO boardFileVO : fileBoardVO.getFileList()) {
						boardFileVO.setRef(fileBoardVO.getIdx());
						boardFileDAO.insert(sqlSession, boardFileVO);
					}
				}
				// 5) 기존 파일을 삭제한다.
				if(delfile!=null) {
					for(String idx : delfile) {
						// DB에서 해당 번호 파일의 정보를 읽어온다.
						BoardFileVO fileVO = boardFileDAO.selectByIdx(sqlSession, Integer.parseInt(idx));
						if(fileVO!=null) {
							// DB의 첨부 삭제
							boardFileDAO.delete(sqlSession, Integer.parseInt(idx));
							// 서버에 저장된 파일 삭제
							File file = new File(path + File.separator + fileVO.getSaveName());
							file.delete();
						}
					}
				}
			}
			//------------------------------------------------------------------------
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		//------------------------------------------------------------------------
		log.debug("update 리턴 : ");
	}
	@Override
	public void delete(FileBoardVO fileBoardVO, String path) {
		log.debug("delete 호출 : " + fileBoardVO);
		//------------------------------------------------------------------------
		SqlSession sqlSession = null;
		FileBoardDAO fileBoardDAO = null;
		BoardFileDAO boardFileDAO = null;
		try {
			sqlSession = MybatisApp.getSqlSessionFactory().openSession(false);
			fileBoardDAO = FileBoardDAOImpl.getInstance();
			boardFileDAO = BoardFileDAOImpl.getInstance();
			//------------------------------------------------------------------------
			// 1) DB에서 해당 글번호의 글을 읽어온다.
			FileBoardVO dbVO = selectByIdx(fileBoardVO.getIdx());
			// 2) 비번이 같으면 삭제한다.
			if(dbVO!=null && dbVO.getPassword().equals(fileBoardVO.getPassword())) {
				// 3) 첨부파일이 있으면 첨부 파일도 삭제한다. -- DB삭제, 저장된 파일도 삭제
				fileBoardDAO.delete(sqlSession, fileBoardVO.getIdx()); // 원본글 삭제
				if(dbVO.getFileList()!=null) {
					for(BoardFileVO vo : dbVO.getFileList()) {
						// DB의 첨부 삭제
						boardFileDAO.delete(sqlSession, vo.getIdx());
						// 서버에 저장된 파일 삭제
						File file = new File(path + File.separator + vo.getSaveName());
						file.delete();
					}
				}
			}
			//------------------------------------------------------------------------
			sqlSession.commit();
		}catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		//------------------------------------------------------------------------
		log.debug("delete 리턴 : ");
	}
}
