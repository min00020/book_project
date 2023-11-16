package co.yedam.cart.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.cart.service.CartJoinVO;
import co.yedam.cart.service.CartService;
import co.yedam.cart.serviceImpl.CartServiceImpl;
import co.yedam.common.Command;

public class CartListControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String path = "/WEB-INF/cart/cartList.jsp";
		
		CartService svc = new CartServiceImpl();
		
		String id = (String) req.getSession().getAttribute("id");
		System.out.println(id);
		List<CartJoinVO> list = svc.cartList(id);
		
		req.setAttribute("cartList", list);
		System.out.println(list);


		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
