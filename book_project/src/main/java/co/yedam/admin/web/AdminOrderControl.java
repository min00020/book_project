package co.yedam.admin.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.admin.service.AdminOrderService;
import co.yedam.admin.serviceImpl.AdminOrderServiceImpl;
import co.yedam.book.service.BookService;
import co.yedam.book.service.BookVO;
import co.yedam.book.serviceImpl.BookServiceImpl;
import co.yedam.common.Command;
import co.yedam.order.service.OrderVO;

public class AdminOrderControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "admin/adminorder.tiles";

		AdminOrderService svc = new AdminOrderServiceImpl();

		List<OrderVO> list = svc.selectOrderList();
		System.out.println("adminOrdercont:"+list);
		System.out.println("테스트");
		req.setAttribute("list", list);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
