package co.yedam.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.board.service.BoardVO;
import co.yedam.order.service.OrderVO;

public interface UserEtcMapper {
	// 사용자별 주문 목록
	public List<OrderVO> selectorder(@Param("id") String id);
	// 사용자별 게시판 목록
	public List<BoardVO> selectqna(@Param("id") String id);
	public List<BoardVO> selectreview(@Param("id") String id);
}
