package board.dao;

import org.springframework.stereotype.Repository;

import board.domain.BoardVO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class BoardDaoMybatis implements BoardDao{
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public BoardDaoMybatis(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public int getArticleCount() {
		return sqlSessionTemplate.selectOne("count");
	}
	
	@Override 
	public List<BoardVO> getArticles(int start, int end){
		return sqlSessionTemplate.selectList("list");
	}
	
	@Override
	public void insertArticle(BoardVO boardVO) {
		   sqlSessionTemplate.insert("insert" , boardVO);
	}
	
	@Override
	public BoardVO getArticle(int num) {
		return sqlSessionTemplate.selectOne("content", num);
	}
}

