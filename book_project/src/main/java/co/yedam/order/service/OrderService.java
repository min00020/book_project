package co.yedam.order.service;

import java.util.List;

public interface OrderService {

	public List<OrderJoinVO> orderList(String id);
	public boolean addOrder(OrderVO vo); //결제정보 입력
	
	public boolean addOrderItem(OrderItemVO vo);
}
