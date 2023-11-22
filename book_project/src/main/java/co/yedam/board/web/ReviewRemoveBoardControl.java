package co.yedam.board.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.board.service.BoardService;
import co.yedam.board.service.BoardVO;
import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.common.Command;

public class ReviewRemoveBoardControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String bno = req.getParameter("bno");
		BoardService svc = new BoardServiceImpl();
		
		BoardVO vo = svc.getBoard(Integer.parseInt(bno));
		
		if(svc.removeBoard(Integer.parseInt(bno))) {
			switch(vo.getBoardSort()) {
			case "QnA게시판":
				try {
					resp.sendRedirect("qnaBoard.do"); //removeform.jsp
				} catch (Exception e) {
					e.printStackTrace();
				}
				break;
			case "리뷰게시판":
				try {
					resp.sendRedirect("bookReview.do");
				} catch (IOException e) {
					e.printStackTrace();
				}
				break;
			case "공지사항":
				try {
					resp.sendRedirect("bookNotice.do");
				} catch (IOException e) {
					e.printStackTrace();
				}
				break;
			}
		} else {
			try {
				resp.sendRedirect("reviewModifyForm.do");
			} catch (IOException e) {
				// TODO Auto-generated catch block
			}
		}
	}

}

