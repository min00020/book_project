package co.yedam.book.service;

import lombok.Data;

@Data
public class BookVO {
	private int bookNo;
	private String bookTitle;
	private String bookWriter;
	private String bookPublisher;
	private int bookPrice;
	private int bookCnt;
	private String bookImage;
	private String bookSort;
	private String bookContent;
	
	private String bookType; // 책 분류

}
