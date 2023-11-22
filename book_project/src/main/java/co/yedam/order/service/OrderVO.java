package co.yedam.order.service;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private int odrCode;
	private String userId;
	private String userName;
	private String odrZipcode;
	private String odrAddr;
	private String odrAddrD;
	private String odrPhone;
	private int odrTotalPrice;
	private String odrStatus;
	private Date odrDate;
	private String odrRequest;
}
