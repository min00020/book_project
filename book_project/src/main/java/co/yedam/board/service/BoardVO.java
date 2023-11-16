package co.yedam.board.service;

import java.util.Date;

import javax.servlet.annotation.WebServlet;

import lombok.Data;

@Data
public class BoardVO {
	private int boardNo;        // 
	private int bookNo;         // 북 넘버
	private String boardReview;  // 타이틀 느낌으로 써야함
	private String boardContent; // 내용
	private Date BoardDate;    // 등록 날짜
	private String boardSort; //종류
	private int BoardCnt;     //조회수
	private String userId;    // 유저아이디
	
//  private String boardTitle;	// boardReview 대신 써야할듯
//  private String img; // 이미지도 가져와야함
	

}
