package co.yedam.cart.mapper;

import java.util.List;

import co.yedam.cart.service.CartJoinVO;
import co.yedam.cart.service.CartVO;

public interface CartMapper {

	public List<CartJoinVO> cartList(String id); // 장바구니 목록
	
	public int addCart(CartVO vo); // 장바구니 추가

	public int deleteCart(int cartCode); // 장바구니 삭제

	public int updateCart(int cartAmount); // 장바구니 수정


}
