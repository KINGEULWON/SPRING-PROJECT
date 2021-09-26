package board.dao;

import java.util.HashMap;
import java.util.List;

import board.domain.BoardVO;

public interface BoardDao {
	//전체 글 개수를 알아오는 메서드
	public abstract int listCount();//count
	//글 목록을 가져와서 List로 반환하는 메서드
	public abstract List<BoardVO> getArticles(HashMap<String,Integer>map);
	//글 저장을 처리하는 메서드
	public abstract void insert(BoardVO article);
	//글 내용을 가져오는 메서드
	public abstract BoardVO select(int num);//select
}

