package co.yedam.reply.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSourceMybatis;
import co.yedam.reply.mapper.ReplyMapper;
import co.yedam.reply.service.ReplyService;
import co.yedam.reply.service.ReplyVO;

public class ReplyServiceImpl implements ReplyService {
	private SqlSession sqlSession = DataSourceMybatis.getInstance().openSession(true); //자동 커밋
	private ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
	@Override
	public List<ReplyVO> replylist(int boardNo, int page) {
		return mapper.replyList(boardNo, page);
	}
	@Override
	public ReplyVO getReply(int replyNo) {
		return mapper.selectReply(replyNo);
	}
	@Override
	public boolean addReply(ReplyVO vo) {
		return mapper.insertReply(vo) > 0;
	}
	@Override
	public boolean editReply(ReplyVO vo) {
		return mapper.updateReply(vo) > 0;
	}
	@Override
	public boolean delReply(int replyNo) {
		return mapper.deleteReply(replyNo) > 0;
	}
	@Override
	public int getTotalCnt(int boardNo) {
		return mapper.getTotalCnt(boardNo);
	}
	@Override
	public List<Map<String, Object>> getReplyCountByWriter() {
		return mapper.getReplyCountByWriter();
	}
}
