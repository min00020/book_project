package co.yedam.book.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.book.service.BookService;
import co.yedam.book.service.BookVO;
import co.yedam.book.serviceImpl.BookServiceImpl;
import co.yedam.common.Command;

public class BookInventoryControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String path = "book/bookshop.tiles";
		
		String cate = req.getParameter("cate"); // 책 카테고리 분류
		
		
		BookService svc =new BookServiceImpl();
		List<BookVO> list = null;
		if(cate == null) {
			//전체검색
			list = svc.bookList();
		}
		else {
			list = svc.invenbook(Integer.parseInt(cate));
		}
		
		req.setAttribute("list", list);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
