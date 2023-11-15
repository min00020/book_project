package co.yedam.admin.mapper;

import java.util.List;

import co.yedam.book.service.BookVO;
import co.yedam.order.service.OrderVO;

public interface AdminMainMapper {
	public List<BookVO> bkList(); //책 목록 가져오기
	
	public int totalPriceAvg(); //판매금액 총합계
	public List<OrderVO> monthTotalPrice(); //판매금액 월별 합계
	public int orderCnt(); //배송완료 건수
	
	
}
