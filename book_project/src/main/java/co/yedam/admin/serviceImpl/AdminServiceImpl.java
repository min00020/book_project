package co.yedam.admin.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.yedam.admin.mapper.AdminMainMapper;
import co.yedam.admin.service.AdminService;
import co.yedam.common.DataSourceMybatis;

public class AdminServiceImpl implements AdminService{
	SqlSession sqlSession = DataSourceMybatis.getInstance().openSession(true); //자동 커밋
	AdminMainMapper mapper = sqlSession.getMapper(AdminMainMapper.class);
	
	@Override
	public int totalPriceSum() {
		return mapper.totalPriceSum();
	}
	@Override
	public int orderCnt() {
		return mapper.orderCnt();
	}
	@Override
	public List<Map<String, Object>> monthPrice() {
		return mapper.monthPrice();
	}
	@Override
	public int sysmonthPrice() {
		return mapper.sysmonthPrice();
	}
	@Override
	public int orderPercent() {
		return mapper.orderCnt();
	}
	@Override
	public int userGender() {
		return mapper.userGender();
	}
	@Override
	public int reqDelivery() {
		return mapper.reqDelivery();
	}

}
