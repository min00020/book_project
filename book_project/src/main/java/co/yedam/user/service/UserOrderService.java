package co.yedam.user.service;

import java.util.List;

import co.yedam.board.service.BoardVO;
import co.yedam.order.service.OrderVO;

public interface UserOrderService {
	public List<OrderVO> selectorder(String id);
	public List<BoardVO> selectqna();
	public List<BoardVO> selectreview();
}
