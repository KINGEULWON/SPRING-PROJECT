package board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import board.dao.BoardDao;
import board.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	private BoardDao boardDao;
	
	public BoardDao getBoardDao() {
		return boardDao;
	}
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	@Override
	public List<BoardVO> list(){
		return boardDao.list(start, end)();
	}
	
	@Override
	public void write(BoardVO boardVO) {
		boardDao.insert(boardVO);
	}
	
	@Override
	public BoardVO read(int num) {
		return boardDao.select(num);
	}
}
