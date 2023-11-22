package co.yedam.order.mapper;

import java.util.List;

import co.yedam.order.service.OrderItemVO;
import co.yedam.order.service.OrderJoinVO;
import co.yedam.order.service.OrderVO;

public interface OrderMapper {

	public List<OrderJoinVO> orderList(String id); // 주문 목록
	public int addOrder(OrderVO vo); //결제정보 입력
	
	public int addOrderItem(OrderItemVO vo); // 장바구니 낱개 저장
	
}
