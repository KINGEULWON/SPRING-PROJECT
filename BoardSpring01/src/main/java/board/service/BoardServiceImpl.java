package board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.BoardDao;
import board.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;
	
	public BoardDao getBoardDao() {
		return boardDao;
	}
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	public BoardServiceImpl(BoardDao boardDao) {
		this.boardDao =boardDao;
	}
	
	@Override
	public List<BoardVO> list(int start, int end){
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return boardDao.list(map);
	}
	
	@Override
	public void write(BoardVO boardVO) {
		boardDao.insert(boardVO);
	}
	
	@Override
	public BoardVO read(int num) {
		return boardDao.select(num);
	}
	
	@Override
	public int listCount() {
		return boardDao.listCount();
	}
}
