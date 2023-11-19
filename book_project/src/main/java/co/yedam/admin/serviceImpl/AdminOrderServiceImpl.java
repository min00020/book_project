package co.yedam.admin.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.admin.mapper.AdminEtcMapper;
import co.yedam.admin.service.AdminOrderService;
import co.yedam.book.service.BookVO;
import co.yedam.common.DataSourceMybatis;
import co.yedam.order.service.OrderVO;

public class AdminOrderServiceImpl implements AdminOrderService {
	SqlSession sqlSession = DataSourceMybatis.getInstance().openSession(true); //true=자동커밋
	
	AdminEtcMapper mapper = sqlSession.getMapper(AdminEtcMapper.class);
	
	@Override
	public List<OrderVO> selectOrderList() {
		return mapper.selectOrderList();
	}

	@Override
	public boolean addBook(BookVO vo) {
		return mapper.insertBook(vo) == 1;
	}

	@Override
	public boolean orderComplete(OrderVO vo) {
		return mapper.orderComplete(vo)==1;
	}


	@Override
	public boolean orderCancle(OrderVO vo) {
		return mapper.orderCancle(vo)==1;
	}


	@Override
	public boolean orderDelivery(OrderVO vo) {
		return mapper.orderDelivery(vo)==1;
	}

}
