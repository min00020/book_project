package co.yedam.order.service;

public interface OrderService {

	public boolean addOrder(OrderVO vo); //결제정보 입력
	
	public boolean addOrderItem(OrderItemVO vo);
}
