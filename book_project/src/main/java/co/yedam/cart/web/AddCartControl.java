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

public class AddCartControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String bno = req.getParameter("bno");
		String uid = req.getParameter("uid");
		
		String amount = req.getParameter("amount");
		CartVO vo = new CartVO();
		vo.setUserId(uid);
		vo.setBookNo(Integer.parseInt(bno));
		vo.setCartAmount(Integer.parseInt(amount));
		
		Gson gson = new GsonBuilder()
				.setDateFormat("yyyy-MM-dd")
				.create();
		Map<String, Object> map = new HashMap<>();
		
		CartService svc = new CartServiceImpl();
		//장바구니에 기존 상품이 있는지 검사
		
		if(svc.addCart(vo)) {
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
