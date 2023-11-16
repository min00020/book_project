package co.yedam.book.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.book.service.BookService;
import co.yedam.book.service.BookVO;
import co.yedam.book.serviceImpl.BookServiceImpl;
import co.yedam.common.Command;

public class BookInfoControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String path = "book/bookInfo.tiles";
		
		String bno = req.getParameter("bno");
		
		BookService svc = new BookServiceImpl();
		
		BookVO vo = svc.getBook(bno);
		
		req.setAttribute("bno", vo);
		
		
		List<BookVO> list = svc.selectBook();
		
		req.setAttribute("list", list);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
