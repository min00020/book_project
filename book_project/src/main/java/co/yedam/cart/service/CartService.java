package co.yedam.cart.service;

import java.util.List;

public interface CartService {

	public List<CartVO> cartList();
	
	public boolean addCart(CartVO vo);
	public boolean deleteCart(int cartCode);
}
