package co.yedam.admin.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.admin.mapper.AdminMainMapper;
import co.yedam.admin.service.AdminService;
import co.yedam.common.DataSourceMybatis;
import co.yedam.order.service.OrderVO;

public class AdminServiceImpl implements AdminService{
	SqlSession sqlSession = DataSourceMybatis.getInstance().openSession(true); //자동 커밋
	AdminMainMapper mapper = sqlSession.getMapper(AdminMainMapper.class);
	
	@Override
	public List<OrderVO> monthTotalPrice() {
		return mapper.monthTotalPrice();
	}

	@Override
	public int totalpriceavg() {
		return mapper.totalPriceAvg();
	}

	@Override
	public int orderCnt() {
		return mapper.orderCnt();
	}

}
