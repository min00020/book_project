package co.yedam.admin.service;

import java.util.List;

import co.yedam.order.service.OrderVO;

public interface AdminOrderService {
	public List<OrderVO> selectOrderList(); //주문목록
	public boolean orderStatus(OrderVO vo); //주문상태변경
	
}
