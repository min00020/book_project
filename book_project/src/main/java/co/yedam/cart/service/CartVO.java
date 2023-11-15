package co.yedam.cart.service;

import lombok.Data;

@Data
public class CartVO {
	
		private int cartCode;
		private int bookNo;
		private String userId;
		private int cartAmount;
		
}
