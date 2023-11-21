package co.yedam.board.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.board.mapper.BoardMapper;
import co.yedam.board.service.BoardService;
import co.yedam.board.service.BoardVO;
import co.yedam.common.DataSourceMybatis;

public class BoardServiceImpl implements BoardService {
	SqlSession sqlSession = DataSourceMybatis.getInstance().openSession(true); //자동 커밋
	BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
	@Override
	public List<BoardVO> boardList() {
		return mapper.selectList();
	}
	@Override
	public BoardVO getBoard(int boardNo) {
		mapper.boardCnt(boardNo);
		return mapper.select(boardNo);
	}
	@Override
	public boolean addBoard(BoardVO vo) {
		return mapper.insert(vo) > 0;
	}
	@Override
	public boolean editBoard(BoardVO vo) {
		return mapper.update(vo) > 0;
	}
	@Override
	public boolean removeBoard(int boardNo) {
		return mapper.delete(boardNo) > 0;
	}
	@Override
	public List<BoardVO> selectQnaList() {
		return mapper.selectQnaList();
	}
	@Override
	public List<BoardVO> selectBookReviewList() {
		return mapper.selectBookReviewList();
	}
	@Override
	public List<BoardVO> selectBookNoticeList() {
		return mapper.selectBookNoticeList();
	}
	@Override
	public List<BoardVO> selectDetailList() {
		return mapper.selectDetailList();
	}
	@Override
	public List<BoardVO> bookJoinList() {
		return mapper.bookJoinList();
	}
	
	
}
