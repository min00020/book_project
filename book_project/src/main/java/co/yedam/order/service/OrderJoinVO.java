package co.yedam.order.service;

import lombok.Data;

@Data
public class OrderJoinVO {

	private int odrCode;
	private int bookNo;
	private String userId;
	private String userName;
	private String bookImage;
	private int odrAmount;
	private String bookTitle;
	private int bookPrice;
}
