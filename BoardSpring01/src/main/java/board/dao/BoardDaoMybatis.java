package board.dao;

import org.springframework.stereotype.Repository;

import board.domain.BoardVO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

@Repository
public class BoardDaoMybatis implements BoardDao{
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public BoardDaoMybatis(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public int listCount() {
		return sqlSessionTemplate.selectOne("listcount");
	}
	
	@Override 
	public List<Map<String, String>> list(int start, int end){
		return sqlSessionTemplate.selectList("list");
	}
	
	@Override
	public void insert(BoardVO boardVO) {
		   sqlSessionTemplate.insert("insert" , boardVO);
	}
	
	@Override
	public BoardVO select(int num) {
		BoardVO vo = (BoardVO) sqlSessionTemplate.selectOne("select", num);
		return vo;
	}
	
}

