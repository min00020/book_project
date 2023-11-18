package co.yedam.board.mapper;

import java.util.List;

import co.yedam.board.service.BoardVO;

public interface BoardMapper {
	public List<BoardVO> selectList();
	public BoardVO select(int boardNo);
	public int updateCnt(int boardNo);
	public int insert(BoardVO vo);
	public int update(BoardVO vo);
	public int delete(int boardNo);
	
	
	public List<BoardVO> selectQnaList();
	
	//로그인관련
//	public UserVO getUser(@Param("id")String id,@Param("pass") String pw);
//	public List<UserVO> memberList();
}
