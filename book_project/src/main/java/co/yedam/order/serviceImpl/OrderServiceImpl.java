package co.yedam.order.serviceImpl;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSourceMybatis;
import co.yedam.order.mapper.OrderMapper;
import co.yedam.order.service.OrderService;
import co.yedam.order.service.OrderVO;

public class OrderServiceImpl implements OrderService{

	SqlSession session = DataSourceMybatis.getInstance().openSession(true);
	OrderMapper mapper = session.getMapper(OrderMapper.class);
	
	@Override
	public boolean addOrder(OrderVO vo) {
		// TODO Auto-generated method stub
		return mapper.addOrder(vo) == 1;
	}

	
}
