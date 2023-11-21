package co.yedam.admin.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.admin.service.AdminOrderService;
import co.yedam.admin.serviceImpl.AdminOrderServiceImpl;
import co.yedam.common.Command;
import co.yedam.order.service.OrderVO;

public class AdminOrderUpdate implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
			
		
		String ono = req.getParameter("ono");
		String status = req.getParameter("status");
		
		OrderVO vo = new OrderVO();

		vo.setOdrCode(Integer.parseInt(ono));
		vo.setOdrStatus(status);
		
		Map<String, Object> map = new HashMap<>();
		AdminOrderService svc = new AdminOrderServiceImpl();
		if(svc.orderStatus(vo)) {
			map.put("retCode", "OK");
			map.put("vo", vo);
		} else {
			map.put("retCode", "NG");
		}
		Gson gson = new GsonBuilder().create();
		
		String json = gson.toJson(map);
		resp.setContentType("text/json;charset=utf-8");
		try {
			resp.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
