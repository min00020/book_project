package co.yedam.order.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.cart.service.CartJoinVO;
import co.yedam.cart.service.CartService;
import co.yedam.cart.serviceImpl.CartServiceImpl;
import co.yedam.common.Command;
import co.yedam.user.service.UserService;
import co.yedam.user.service.UserVO;
import co.yedam.user.serviceImpl.UserServiceImpl;

public class OrderSuressControl implements Command{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		CartService csvc = new CartServiceImpl();
		UserService usvc = new UserServiceImpl();
		
		
		String id = (String) req.getSession().getAttribute("id");
		UserVO vo = usvc.getUser(id);
		System.out.println(id);
		List<CartJoinVO> list = csvc.cartList(id);
		
		String totalPrice = req.getParameter("totalPrice");
		
		req.setAttribute("cartList", list);
		System.out.println(list);
		req.setAttribute("userInfo", vo);
		req.setAttribute("totalPrice", totalPrice);
		
		
		try {
			req.getRequestDispatcher("WEB-INF/order/orderSuress.jsp").forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
}