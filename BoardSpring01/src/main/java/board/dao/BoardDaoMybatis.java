package board.dao;

import org.springframework.stereotype.Repository;

import board.domain.BoardVO;

import java.util.HashMap;
import java.util.List;


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
	public List<BoardVO> getArticles(HashMap<String, Integer>map){
		return sqlSessionTemplate.selectList("list", map);
	}
	
	@Override
	public void insert(BoardVO article) {
		int num = article.getNum();
		int ref = article.getRef();
		int step = article.getStep();
		int depth = article.getDepth();
		int number = 0;
		
		if(sqlSessionTemplate.selectOne("selectNum") != null) {
		number = sqlSessionTemplate.selectOne("selectNum");
		}
		
		if (number != 0) {
			number += 1;
		} else {
			number = 1;
		}
		if (num != 0) {
			sqlSessionTemplate.update("reply", article);
			step = step + 1;
			depth = depth +1;
		} else {
			ref = number;
			step = 0;
			depth = 0;
		}
		article.setRef(ref);
		article.setStep(step);
		article.setDepth(depth);
		sqlSessionTemplate.insert("insert", article);
	}
	
	@Override
	public BoardVO select(int num) {
		sqlSessionTemplate.update("readcount", num);
		return sqlSessionTemplate.selectOne("content",num);
	}
	
}

