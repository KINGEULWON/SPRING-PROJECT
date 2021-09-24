package board.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import board.dao.BoardDao;
import board.domain.BoardVO;
import board.model.BoardDto;
import board.model.ConnUtil;
import board.service.BoardService;

@Controller
@SessionAttributes("BoardVO")
public class BoardController {
	private BoardService boardService;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
		
	@RequestMapping(value="/board/count")
	public int listCount(){
		boardService.listCount();
	}
	
	
	@RequestMapping(value="/board/list")
	public String list (Model model, HttpSession session, @RequestParam(value="pageNum", defaultValue="0") int pageNum){
		
		if (pageNum == 0) {
			pageNum = 1; 
			}
			int pageSize = 10; //한 페이지당 글의 개수
			int currentPage = pageNum;
			// 페이지의 시작 글 번호
			
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = currentPage * pageSize;	//한 페이지의 마지막 글 번호
			int count = 0;
			int number = 0;
			List<BoardVO> articleList = null;
			count = boardService.listCount();	// 전체 글 개수
			if(count > 0) {
				articleList = boardService.list(startRow, endRow);
			} else { 
				articleList = Collections.emptyList();
			}
			number = count - (currentPage - 1) * pageSize;	//글 목록에 표시할 글 번호
			
			model.addAttribute("currentPage",new Integer(currentPage));
			model.addAttribute("startRow",new Integer(startRow));
			model.addAttribute("endRow",new Integer(endRow));
			model.addAttribute("count",new Integer(count));
			model.addAttribute("pageSize",new Integer(pageSize)); 
			model.addAttribute("number",new Integer(number));
			model.addAttribute("articleList",articleList);
			
			session.setAttribute("pageNum", pageNum);
			
			return "/board/list";
	}
		
	@RequestMapping(value="/board/insert/", method=RequestMethod.GET)
	public String insert(Model model) {
		model.addAttribute("boardVO", new BoardVO());
		return "/board/insert";
	}
	
	@RequestMapping(value="/board/insert")
	public void insert(BoardVO article){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int num = article.getNum();
			int ref = article.getRef();
			int step = article.getStep();
			int depth = article.getDepth();
			int number = 0;
			String sql = "";
			try{
				pstmt = conn.prepareStatement("select max(num) from BOARD2");
				rs = pstmt.executeQuery();
				if(rs.next()){
					number = rs.getInt(1) + 1;
				} else {
					number = 1;
				}
				if(num != 0){	//답글일 경우
					sql = "update BOARD2 set STEP = STEP+1 where REF = ? and STEP > ?";
					pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, ref);
					pstmt.setInt(2, step);
					pstmt.executeUpdate();
					step = step + 1;
					depth = depth + 1;
				} else {	//새글일 경우
					ref = number;
					step = 0;
					depth = 0;
				}	
				//쿼리 작성
				sql = "insert into BOARD2"
						+ "(NUM, UPLOADER, EMAIL, SUBJECT, PASS, "
						+ "REGDATE, FILENAME, REF, STEP, DEPTH, CONTENT, IP) "
						+ "values(BOARD2_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, article.getUploader());
				pstmt.setString(2, article.getEmail());
				pstmt.setString(3, article.getSubject());
				pstmt.setString(4, article.getPass());
				pstmt.setTimestamp(5, article.getRegdate());
				pstmt.setString(6, article.getFilename());
				pstmt.setInt(7, ref);
				pstmt.setInt(8, step);
				pstmt.setInt(9, depth);
				pstmt.setString(10, article.getContent());
				pstmt.setString(11, article.getIp());
				pstmt.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(rs != null) try { rs.close(); } catch (SQLException e){}
				if(pstmt != null) try { pstmt.close(); } catch (SQLException e){}
				if(conn != null) try { conn.close(); } catch (SQLException e){}
			}
		}
		
		
		@RequestMapping(value="/board/read/{seq}")
		public String read(Model model, @PathVariable int num){
			model.addAttribute("boardVO", boardService.read(num));
			return "/board/read";
		}
		
		@RequestMapping(value="/board/content"){
			//해당 글번호
			
			return "/board/content.jsp"; //요청에 응답할 뷰 경로
		}
}
