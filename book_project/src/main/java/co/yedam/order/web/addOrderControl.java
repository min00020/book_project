package co.yedam.order.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Command;
import co.yedam.order.service.OrderService;
import co.yedam.order.service.OrderVO;
import co.yedam.order.serviceImpl.OrderServiceImpl;

public class addOrderControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub

		String id = (String) req.getSession().getAttribute("id");
		String name = req.getParameter("name");
		String addr = req.getParameter("addr");
		String addrd = req.getParameter("addrd");
		String phone = req.getParameter("phone");
		String zipcode = req.getParameter("zipcode");
		String totalPrice = req.getParameter("totalPrice");
		String request = req.getParameter("request");

		OrderVO vo = new OrderVO();
		vo.setOdrAddr(addr);
		vo.setOdrAddrD(addrd);
		vo.setOdrPhone(phone);
		vo.setUserId(id);
		vo.setOdrZipcode(zipcode);
		vo.setOdrTotalPrice(Integer.parseInt(totalPrice));
		vo.setOdrRequest(request);
		vo.setUserName(name);

		OrderService svc = new OrderServiceImpl();
		Map<String, Object> map = new HashMap<>();

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		if (svc.addOrder(vo)) {
			map.put("vo", vo);
			map.put("retCode", "OK");
		} else {
			map.put("retCode", "NG");
		}
		resp.setContentType("text/json;charset=utf-8");
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(map);
	}
}
