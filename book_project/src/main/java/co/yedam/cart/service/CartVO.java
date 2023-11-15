package co.yedam.cart.service;

import lombok.Data;

@Data
public class CartVO {
	
		private int cartcode;
		private int bookno;
		private String userid;
		private int cartamount;
		
}
