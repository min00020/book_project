package co.yedam.board.service;

import java.util.List;

import co.yedam.user.service.UserVO;

public interface BoardService {
		public List<BoardVO> boardList();     //목록
		public BoardVO getBoard(int boardNo); // 단건 조회
		public boolean addBoard(BoardVO vo);  // 등록		
		public boolean editBoard(BoardVO vo);  // 수정
		public boolean removeBoard(int boardNo); // 삭제

		// qna 게시판
		public List<BoardVO> selectQnaList();
		// 책 리뷰 게시판
		public List<BoardVO> selectBookReviewList();
		// 공지사항
		public List<BoardVO> selectBookNoticeList();
		//로그인
//		public UserVO loginCheck(String id, String pw);
//		public List<UserVO> memberList();	
}
