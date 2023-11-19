package co.yedam.board.service;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int boardNo;         // 리뷰 번호
	private int bookNo;          // 북 넘버 상품이 넘어옴
	private String boardTitle;   // 리뷰 제목
	private String boardContent; // 리뷰 내용
	private Date boardDate;      // 등록 날짜
	private String boardSort;    // 종류가 rivew or q&a??
	private int boardCnt;        // 조회수
	private String userId;       // 유저아이디
	private int likeCnt;         //별점
	
	
	private String boardImage; //   이미지도 가져와야함
	

}
