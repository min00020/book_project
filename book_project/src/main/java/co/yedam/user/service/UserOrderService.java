package co.yedam.user.service;

import java.util.List;

import co.yedam.order.service.OrderVO;

public interface UserOrderService {
	public OrderVO orderuser (String id);
	public List<OrderVO> selectorder(String id);
}
