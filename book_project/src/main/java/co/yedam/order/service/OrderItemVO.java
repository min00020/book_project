package co.yedam.order.service;

import lombok.Data;

@Data
public class OrderItemVO {

	private int orderCode;
	private int bookNo; 
	private int odrAmount; // 구매수량
	private String userId;

	
}
