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

public class BookMainControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "book/bookmain.tiles";
		
		BookService svc = new BookServiceImpl();
		
		List<BookVO> list = svc.bookList();
		
		System.out.println(list);
		
		req.setAttribute("list", list);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
