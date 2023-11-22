package co.yedam.order.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.order.service.OrderJoinVO;
import co.yedam.order.service.OrderService;
import co.yedam.order.serviceImpl.OrderServiceImpl;

public class OrderSuressControl implements Command{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String path = "/WEB-INF/order/orderSuress.jsp";
		OrderService svc = new OrderServiceImpl();
		
		
		String id = (String) req.getSession().getAttribute("id");
		System.out.println(id);
		List<OrderJoinVO> list = svc.orderList(id);
		
		
		req.setAttribute("orderList", list);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
