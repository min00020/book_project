package co.yedam.admin.mapper;

import java.util.List;
import java.util.Map;

import co.yedam.book.service.BookVO;

public interface AdminMainMapper {
	
	//첫페이지
	//이번달판매금액, 올해판매금액, 판매 취소비율, 월별통계그래프, 총주문건수, 구매자성별비율
	
	public int sysmonthPrice(); //이번달판매금액
	public int totalPriceSum(); //올해판매금액
	public int orderPercent(); //판매 취소비율
	public List<Map<String, Object>> monthPrice();//월별판매금액 합계 그래프
	public int orderCnt(); //총주문건수(취소건제외)
	public int reqDelivery(); //배송요청건수(주문완료상태)
	public int userGender();
	
	public List<BookVO> bkList(); //책 목록 가져오기
	
	
}
