package co.yedam.order.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.cart.service.CartJoinVO;
import co.yedam.cart.service.CartService;
import co.yedam.cart.serviceImpl.CartServiceImpl;
import co.yedam.common.Command;
import co.yedam.order.service.OrderItemVO;
import co.yedam.order.service.OrderService;
import co.yedam.order.serviceImpl.OrderServiceImpl;

public class addOrderItemControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub

		String id = (String) req.getSession().getAttribute("id");
		String ocode = req.getParameter("ocode");
		String bno = req.getParameter("bno");
		String amount = req.getParameter("amount");
		String totalPrice = req.getParameter("totalPrice");

		OrderItemVO vo = new OrderItemVO();
		vo.setOrderCode(Integer.parseInt(ocode));
		vo.setUserId(id);
		vo.setBookNo(Integer.parseInt(bno));
		vo.setOdrAmount(Integer.parseInt(amount));
		vo.setOdrTotalprice(Integer.parseInt(totalPrice));

		OrderService svc = new OrderServiceImpl();
		Map<String, Object> map = new HashMap<>();

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();

		if (svc.addOrderItem(vo)) {
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
