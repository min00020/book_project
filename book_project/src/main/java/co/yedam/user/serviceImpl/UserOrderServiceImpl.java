package co.yedam.user.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.board.service.BoardVO;
import co.yedam.common.DataSourceMybatis;
import co.yedam.order.service.OrderVO;
import co.yedam.user.mapper.UserEtcMapper;
import co.yedam.user.service.UserOrderService;

public class UserOrderServiceImpl implements UserOrderService {
	SqlSession sqlSession  = DataSourceMybatis.getInstance().openSession(true);
	UserEtcMapper mapper = sqlSession.getMapper(UserEtcMapper.class);
	
	@Override
	public List<OrderVO> selectorder(String id) {
		return mapper.selectorder(id);
	}
	@Override
	public List<BoardVO> selectqna() {
		return mapper.selectqna();
	}

	@Override
	public List<BoardVO> selectreview() {
		// TODO Auto-generated method stub
		return mapper.selectreview();
	}
}
