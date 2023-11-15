package co.yedam.cart.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.cart.service.CartService;
import co.yedam.cart.service.CartVO;
import co.yedam.cart.serviceImpl.CartServiceImpl;
import co.yedam.common.Command;

public class AddCartControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String bno = req.getParameter("bno");
		String uid = req.getParameter("uid");
		String amount = req.getParameter("amount");
		
		CartVO vo = new CartVO();
		vo.setBookNo(Integer.parseInt(bno));
		vo.setUserId(uid);
		vo.setCartAmount(Integer.parseInt(amount));
		
		Map<String, Object> map = new HashMap<>();
		CartService svc = new CartServiceImpl();
		if(svc.addCart(vo)) {
			map.put("retCode", "OK");
			map.put("vo", vo);
		} else {
			map.put("retCode", "NG");
		}
		resp.setContentType("text/json;charset=utf-8");
		try {
			resp.getWriter().print(map);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
