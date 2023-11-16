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
		
		List<Map<String, Object>> totlalist = mapper.monthPrice();
		System.out.println("main.exe조회:" + totlalist);
		 
		
	}

}
