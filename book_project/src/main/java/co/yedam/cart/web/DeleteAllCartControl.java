package co.yedam.cart.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.cart.service.CartService;
import co.yedam.cart.serviceImpl.CartServiceImpl;
import co.yedam.common.Command;

public class DeleteAllCartControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String id = (String) req.getSession().getAttribute("id");
		
		CartService svc = new CartServiceImpl();
		
		
		if (svc.deleteAllCart(id)) {
			try {
				resp.sendRedirect("cartListInfo.do");
				 resp.getWriter().print("{\"retCode\" : \"OK\"}");

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