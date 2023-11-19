package co.yedam.cart.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import co.yedam.cart.service.CartService;
import co.yedam.cart.serviceImpl.CartServiceImpl;
import co.yedam.common.Command;

public class updateCartControl implements Command{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		String amount = req.getParameter("amount");

		
		System.out.println(amount);
		CartService svc = new CartServiceImpl();
		if(svc.updateCart(Integer.parseInt(amount))) {
			try {
				resp.sendRedirect("cartListInfo.do");
				//resp.getWriter().print("{\"retCode\" : \"OK\"}");
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.getWriter().print("{\"retCode\" : \"NG\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}

	
