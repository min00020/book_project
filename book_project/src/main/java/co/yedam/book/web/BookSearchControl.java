package co.yedam.book.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.book.service.BookService;
import co.yedam.book.service.BookVO;
import co.yedam.book.serviceImpl.BookServiceImpl;
import co.yedam.common.Command;

public class BookSearchControl implements Command {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String path = "book/booksearchpage.tiles";
		String sno = req.getParameter("sno");

		
		
		
		if(sno == null)
			return;
		
		BookService svc = new BookServiceImpl();
		List<BookVO> list = svc.bookserch(sno);
		
		req.setAttribute("list", list);
		req.setAttribute("sno", sno);
		

		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
