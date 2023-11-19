package co.yedam.admin.service;

import java.util.List;

import co.yedam.book.service.BookVO;
import co.yedam.order.service.OrderVO;

public interface AdminOrderService {
	public List<OrderVO> selectOrderList(); //주문목록
	public boolean orderComplete(OrderVO vo); //주문상태변경-주문완료
	public boolean orderCancle(OrderVO vo); //주문취소
	public boolean orderDelivery(OrderVO vo); //배송완료
	
	public boolean addBook(BookVO vo); //도서 추가
	
}
