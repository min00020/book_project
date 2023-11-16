package co.yedam.admin.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.admin.mapper.AdminMainMapper;
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
		System.out.println("책목록:" + list);
		req.setAttribute("booklist", list);

		AdminService adsvc = new AdminServiceImpl();
		int cnt = adsvc.totalPriceSum();
		System.out.println(cnt);

		List<Map<String, Object>> orderMonth = adsvc.monthPrice();

		System.out.println("admincontroll주문건수:" + orderMonth);
		req.setAttribute("orderMonth", orderMonth);

		int orderCnt = adsvc.orderCnt();
		System.out.println("조회:" + orderCnt);
		req.setAttribute("orderCnt", orderCnt);

		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
