package co.yedam.order.service;


import lombok.Data;

@Data
public class OrderItemVO {
	// 장바구니 상품 한개씩 저장
	private int orderCode;
	private int bookNo; 
	private int odrAmount; // 구매수량
	private String userId;
	private int odrTotalprice; 

	
}
