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
	public List<BoardVO> list(HashMap<String, Integer>map){
		return sqlSessionTemplate.selectList("list", map);
	}
	
	@Override
	public void insert(BoardVO article) {
		   int num = article.getNum();
		   int ref = article.getRef();
		   int step = article.getStep();
		   int depth = article.getDepth();
		   int num2 = 0;
		   
		   if(sqlSessionTemplate.selectOne("selectNum") != null) {
			   num2 = sqlSessionTemplate.selectOne("selectNum");
		   }
		   if(num2 !=0) {
			   num2 += 1;
		   }else {
			   num2 = 1;
		   }
		   if(num != 0) {
			   sqlSessionTemplate.update("reply", article);
			   step = step + 1;
			   depth = depth + 1;
		   }else {
			   ref = num2;
			   step = 0;
			   depth =  0;
		   }
		   article.setStep(step);
		   article.setDepth(depth);
		   article.setRef(ref);
		   sqlSessionTemplate.insert("insert" , article);
	}
	
	@Override
	public BoardVO select(int num) {
		sqlSessionTemplate.update("readcount", num);
		return sqlSessionTemplate.selectOne("select",num);
	}
	
}

