package co.yedam.book.service;

import lombok.Data;

@Data
public class BookVO {
	private int bookNo;				// 넘버
	private String bookTitle;       // 제목
	private String bookWriter;      // 저자
	private String bookPublisher;   // 출판사
	private int bookPrice;          // 가격
	private int bookCnt;            // 카운트
	private String bookImage;       // 이미지
	private String bookSort;        // 종류
	private String bookContent;     // 책 소개
	
	private String bookType;        // 책 분류

}
