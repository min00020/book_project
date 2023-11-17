package co.yedam.common;

import java.util.List;

import org.apache.ibatis.session.SqlSession;


import co.yedam.admin.mapper.AdminMainMapper;

import co.yedam.book.mapper.BookMapper;

import co.yedam.book.service.BookService;
import co.yedam.book.service.BookVO;
import co.yedam.book.serviceImpl.BookServiceImpl;


public class mainexe {

	public static void main(String[] args) {
		SqlSession session = DataSourceMybatis.getInstance().openSession(true);
		
		

//		
//		CartVO vo = new CartVO();
//		vo.setBookNo(005);
//		vo.setCartAmount(77000);
//		vo.setUserId("user003");
//		mapper.addCart(vo);
		
//		BookMapper mapper = session.getMapper(BookMapper.class);
//		String test = "내";
//		List<BookVO> list = mapper.bkserch(test);
//		System.out.println(list);
		
//		AdminMainMapper mapper = session.getMapper(AdminMainMapper.class);
//		int sysmonthPrice = mapper.sysmonthPrice();
//		int totalPriceSum = mapper.totalPriceSum();
//		int orderPercent = mapper.orderPercent();
//		List<Map<String, Object>> totlalist = mapper.monthPrice();
//		int orderCnt = mapper.orderCnt();

		
	}

}
