package co.yedam.cart.mapper;

import java.util.List;

import co.yedam.cart.service.CartVO;

public interface CartMapper {

	public List<CartVO> cartList(); // 장바구니 목록
	
	public int addCart(CartVO vo); // 장바구니 추가

	public int deleteCart(int cartCode); // 장바구니 삭제

}
