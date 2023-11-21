package co.yedam.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.yedam.order.service.OrderVO;

public interface UserEtcMapper {
	public OrderVO orderuser (@Param("id") String id);
	public List<OrderVO> selectorder(@Param("id") String id);
}
