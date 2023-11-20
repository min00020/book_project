package co.yedam.cart.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.cart.mapper.CartMapper;
import co.yedam.cart.service.CartJoinVO;
import co.yedam.cart.service.CartService;
import co.yedam.cart.service.CartVO;
import co.yedam.common.DataSourceMybatis;

public class CartServiceImpl implements CartService {

	SqlSession sqlSession = DataSourceMybatis.getInstance().openSession(true); //자동 커밋
	CartMapper mapper = sqlSession.getMapper(CartMapper.class);
	
	@Override
	public List<CartJoinVO> cartList(String id) {
		// TODO Auto-generated method stub
		return mapper.cartList(id);
	}

	@Override
	public boolean addCart(CartVO vo) {
		// TODO Auto-generated method stub
		return mapper.addCart(vo) > 0;
	}

	@Override
	public boolean deleteCart(int cartCode) {
		// TODO Auto-generated method stub
		return mapper.deleteCart(cartCode) > 0;
	}


	@Override
	public boolean modifyCart(CartVO vo) {
		// TODO Auto-generated method stub
		return mapper.modifyCart(vo);
	}

	
}
