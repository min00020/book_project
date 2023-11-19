package co.yedam.admin.mapper;

import java.util.List;

import co.yedam.book.service.BookVO;
import co.yedam.order.service.OrderVO;

public interface AdminEtcMapper {
	//주문관리 (주문조회 > 배송상태변경)
	public List<OrderVO> selectOrderList(); //주문목록
	public int orderComplete(OrderVO vo); //주문상태변경
	public int orderCancle(OrderVO vo); //주문상태변경
	public int orderDelivery(OrderVO vo); //주문상태변경
	
	public int insertBook(BookVO bo); //도서등록
	
	

}
