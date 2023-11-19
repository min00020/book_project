package co.yedam.reply.service;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int boardNo;
	private int replyNo;
	private String reply;
	private String replyer;
	private Date replyDate;
}
