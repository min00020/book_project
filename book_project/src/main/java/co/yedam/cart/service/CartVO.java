package co.yedam.cart.service;

import lombok.Data;

@Data
public class CartVO {
	
		private int cart_code;
		private int book_no;
		private String user_id;
		private int cart_amount;
		
}
