package co.yedam.reply.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ReplyService {
	//목록 단건 추가 수정 삭제
		public List<ReplyVO> replylist(@Param("boardNo")int boardNo,@Param("page")int page);
		public ReplyVO getReply(int replyNo);
		public boolean addReply(ReplyVO vo);
		public boolean editReply(ReplyVO vo);
		public boolean delReply(int replyNo);
		
		// 댓글건수
		public int getTotalCnt(int boardNo);
		
		//차트데이터
		public List<Map<String, Object>> getReplyCountByWriter();
}
