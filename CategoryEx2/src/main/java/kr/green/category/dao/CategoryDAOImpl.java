package kr.green.category.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.green.category.vo.CategoryVO;

public class CategoryDAOImpl implements CategoryDAO {
	private static CategoryDAO instance = new CategoryDAOImpl();
	private CategoryDAOImpl() {}
	public static CategoryDAO getInstance() {
		return instance;
	}
	//---------------------------------------------------------------
	@Override
	public List<CategoryVO> selectList(SqlSession sqlSession) {
		return sqlSession.selectList("category.selectList");
	}
	@Override
	public void insert(SqlSession sqlSession, CategoryVO categoryVO) {
		sqlSession.insert("category.insert", categoryVO);		
	}
	@Override
	public void updateRef(SqlSession sqlSession) {
		sqlSession.update("category.updateRef");
	}
	@Override
	public void updateSeq(SqlSession sqlSession, CategoryVO categoryVO) {
		sqlSession.update("category.updateSeq", categoryVO);
	}
	@Override
	public void reply(SqlSession sqlSession, CategoryVO categoryVO) {
		sqlSession.insert("category.reply", categoryVO);	
	}
	@Override
	public void update(SqlSession sqlSession, CategoryVO categoryVO) {
		sqlSession.update("category.update", categoryVO);
	}
	@Override
	public void delete(SqlSession sqlSession, CategoryVO categoryVO) {
		sqlSession.delete("category.delete", categoryVO);
	}
	@Override
	public List<CategoryVO> selectSeqList(SqlSession sqlSession, CategoryVO categoryVO) {
		return sqlSession.selectList("category.selectSeqList", categoryVO);
	}
	@Override
	public void updateDel(SqlSession sqlSession, CategoryVO categoryVO) {
		sqlSession.update("category.updateDel", categoryVO);
	}
	@Override
	public CategoryVO selectByIdx(SqlSession sqlSession, int idx) {
		return sqlSession.selectOne("category.selectByIdx", idx);
	}
	@Override
	public List<CategoryVO> selectDelList(SqlSession sqlSession) {
		return sqlSession.selectList("category.selectDelList");
	}
}
