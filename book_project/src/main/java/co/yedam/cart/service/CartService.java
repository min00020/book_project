package co.yedam.cart.service;

import java.util.List;

public interface CartService {

	public List<CartJoinVO> cartList(String id);
	
	public boolean addCart(CartVO vo);
	public boolean deleteCart(int cartCode);
	public boolean deleteAllCart(String id);
	public boolean modifyCart(CartVO vo);


}
