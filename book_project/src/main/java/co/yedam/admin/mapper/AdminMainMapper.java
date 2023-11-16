package co.yedam.admin.mapper;

import java.util.List;
import java.util.Map;

import co.yedam.book.service.BookVO;

public interface AdminMainMapper {
	public List<BookVO> bkList(); //책 목록 가져오기
	
	public int totalPriceSum(); //판매금액 총합계
	public int orderCnt(); //배송완료 건수
	
	public List<Map<String, Object>> monthPrice();//판매금액 월별 합계
}
