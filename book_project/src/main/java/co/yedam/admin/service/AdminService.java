package co.yedam.admin.service;

import java.util.List;

import co.yedam.order.service.OrderVO;

public interface AdminService {
	//월별 판매금액, 연별금액, 판매율, 미배송건 조회, 이용성별
		public List<OrderVO> monthTotalPrice();//연도별 판매 금액
		public int totalpriceavg(); //판매금액 총합계 평균
		public int orderCnt();//판매건수(취소건제외)

		
	
}
