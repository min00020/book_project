package co.yedam.common;

import org.apache.ibatis.session.SqlSession;

import co.yedam.cart.mapper.CartMapper;
import co.yedam.cart.service.CartVO;


public class mainexe {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SqlSession session = DataSourceMybatis.getInstance().openSession(true);
		CartMapper mapper = session.getMapper(CartMapper.class);
		
		
		CartVO vo = new CartVO();
		vo.setBookNo(005);
		vo.setCartAmount(77000);
		vo.setUserId("user003");
		mapper.addCart(vo);
	}

}
