package co.yedam.admin.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.admin.service.AdminOrderService;
import co.yedam.admin.serviceImpl.AdminOrderServiceImpl;
import co.yedam.common.Command;
import co.yedam.order.service.OrderVO;

public class AdminOrderUpdate implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
			
		OrderVO vo = new OrderVO();
		if (req.getMethod().equals("get")) {
			
		}else if (req.getMethod().equals("POST")) {
			
		}
		
		String ono = req.getParameter("ono");
		vo.setOdrCode(Integer.parseInt(ono));
		
		Map<String, Object> map = new HashMap<>();
		AdminOrderService svc = new AdminOrderServiceImpl();
		
		if(svc.orderComplete(vo)) {
			map.put("retCode", "OK");
			map.put("vo", vo);
		} else {
			map.put("retCode", "NG");
		}
		resp.setContentType("text/json;charset=utf-8");
		
	}

}
