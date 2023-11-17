package co.yedam.board.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.board.service.BoardService;
import co.yedam.board.service.BoardVO;
import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.common.Command;

public class BoardListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse reps) {
		// 서블릿, jsp는 기능이 같음 // 서블릿(컨트롤 역할: 데이터 처리) -> jsp(뷰)
		BoardService svc = new BoardServiceImpl();
		List<BoardVO> list = svc.boardList();
		
		// req에 정보를 담아서 board/boardList.jsp에 정보를 넘김
		req.setAttribute("list", list);
		
		// 페이지 요청 시(boardList.do), 요청 재지정(board/boardList.jsp)
		// 서블릿 페이지에서 다른 페이지로 이동할 정보를 넣어주고 forward 메소드는 재지정 해줌
		RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/board/boardList.jsp"); // forward(req, resp)
		try {
			rd.forward(req, reps);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		

	}

}
