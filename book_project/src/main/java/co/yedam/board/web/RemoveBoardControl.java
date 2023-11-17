package co.yedam.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.board.service.BoardService;
import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.common.Command;

public class RemoveBoardControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String bno = req.getParameter("bno");
		
		BoardService svc = new BoardServiceImpl();
		if( svc.removeBoard(Integer.parseInt(bno))) {
			try {
				resp.sendRedirect("boardList.do");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
