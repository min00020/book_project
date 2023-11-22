package co.yedam.user.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Command;
import co.yedam.order.service.OrderVO;
import co.yedam.user.service.UserOrderService;
import co.yedam.user.serviceImpl.UserOrderServiceImpl;

public class OrderUserControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		
		System.out.println("id: "+ id);
		
		UserOrderService svc = new UserOrderServiceImpl();
		
		List<OrderVO> list = svc.selectorder(id);
		System.out.println("주문목록 list: "+list);
		
		req.setAttribute("list", list);
		
		String path = "WEB-INF/main/mypage.jsp";
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
