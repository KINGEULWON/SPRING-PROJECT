package board.service;

import java.util.List;

import board.domain.BoardVO;

public interface BoardService {
	public abstract List<BoardVO> list(int start, int end);
	
	public abstract void write(BoardVO boardVO);
	
	public abstract BoardVO read(int num);

	public abstract int listCount();
	
}
