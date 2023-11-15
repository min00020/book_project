package co.yedam.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.admin.service.AdminService;
import co.yedam.admin.serviceImpl.AdminServiceImpl;
import co.yedam.book.service.BookService;
import co.yedam.book.service.BookVO;
import co.yedam.book.serviceImpl.BookServiceImpl;
import co.yedam.common.Command;
import co.yedam.order.service.OrderVO;

public class AdminControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "admin/adminpage.tiles";
		
		BookService svc = new BookServiceImpl();
		List<BookVO> list = svc.bookList();
		System.out.println("책목록:"+list);
		req.setAttribute("booklist", list);
		
		AdminService adsvc = new AdminServiceImpl();
		int cnt = adsvc.totalpriceavg();
		System.out.println(cnt);
		
		List<OrderVO> totalList = adsvc.monthTotalPrice();
		
		System.out.println("주문건수:"+totalList);
		req.setAttribute("totalList", totalList);

		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
