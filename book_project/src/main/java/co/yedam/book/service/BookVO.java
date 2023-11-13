package co.yedam.book.service;

import javax.servlet.annotation.WebFilter;

import lombok.Data;

@Data
@WebFilter
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
	private int bookType;
	
}
