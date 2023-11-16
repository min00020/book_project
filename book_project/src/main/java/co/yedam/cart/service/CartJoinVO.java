package co.yedam.cart.service;

import lombok.Data;

@Data
public class CartJoinVO {
	
	private int cartCode;
	private int bookNo;
	private String userId;
	private String userName;
	private String bookImage;
	private int cartAmount;
	private String bookTitle;
	private int bookPrice;
	
}
