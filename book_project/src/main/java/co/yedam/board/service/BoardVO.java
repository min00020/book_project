package co.yedam.board.service;

import java.util.Date;

import javax.servlet.annotation.WebServlet;

import lombok.Data;

@Data
public class BoardVO {
	private int boardNo;
	private int bookNo;
	private String boardReview;
	private String boardContent;
	private Date BoardDate;
	private String boardSort;
	private int BoardCnt;
	private String userId;

}
