package co.yedam.cart.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.cart.service.CartService;
import co.yedam.cart.serviceImpl.CartServiceImpl;
import co.yedam.common.Command;

public class DeleteCartControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String cno = req.getParameter("cno");
		
		System.out.println(cno);
		
//		Map<String, String> map = new HashMap<>(); //을 써서 해보자
		
		CartService svc = new CartServiceImpl();
		
		if(svc.deleteCart(Integer.parseInt(cno))) {
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
