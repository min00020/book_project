package co.yedam.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.yedam.admin.mapper.AdminMainMapper;


public class mainexe {

	public static void main(String[] args) {
		SqlSession session = DataSourceMybatis.getInstance().openSession(true);
		
//		CartMapper mapper = session.getMapper(CartMapper.class);
//		
//		CartVO vo = new CartVO();
//		vo.setBookNo(005);
//		vo.setCartAmount(77000);
//		vo.setUserId("user003");
//		mapper.addCart(vo);

		AdminMainMapper mapper = session.getMapper(AdminMainMapper.class);
		int sysmonthPrice = mapper.sysmonthPrice();
		int totalPriceSum = mapper.totalPriceSum();
		int orderPercent = mapper.orderPercent();
		List<Map<String, Object>> totlalist = mapper.monthPrice();
		int orderCnt = mapper.orderCnt();
		
		System.out.println("main.exe조회:" + sysmonthPrice);
		System.out.println("main.exe조회:" + totalPriceSum);
		System.out.println("main.exe조회:" + orderPercent);
		System.out.println("main.exe조회:" + totlalist);
		System.out.println("main.exe조회:" + orderCnt);
		
		
	}

}
