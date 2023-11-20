package co.yedam.cart.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.cart.service.CartService;
import co.yedam.cart.service.CartVO;
import co.yedam.cart.serviceImpl.CartServiceImpl;
import co.yedam.common.Command;

public class ModyfiCartControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		CartVO vo = new CartVO();

		String cno = req.getParameter("cno");
		String amo = req.getParameter("amo");
//		String id = req.getParameter("id");
//		String bno = req.getParameter("bno");

		vo.setCartCode(Integer.parseInt(cno));
		vo.setCartAmount(Integer.parseInt(amo));
//		vo.setBookNo(Integer.parseInt(bno));
//		vo.setUserId(id);

		Map<String, Object> map = new HashMap<>();
		CartService svc = new CartServiceImpl();
		if (svc.modifyCart(vo)) {
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