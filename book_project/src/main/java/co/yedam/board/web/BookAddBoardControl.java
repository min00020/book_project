package co.yedam.board.web;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.yedam.board.service.BoardService;
import co.yedam.board.service.BoardVO;
import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.book.service.BookVO;
import co.yedam.common.Command;

public class BookAddBoardControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		//분류 제목 내용 유저아이디 이미지
		BoardVO vo = new BoardVO();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (req.getMethod().equals("get")) {
			
		} else if (req.getMethod().equals("POST")) {
			String saveDir = req.getServletContext().getRealPath("resources/image");
			int size = 5 * 1024 * 1024;
			// multiparRequest mr;
			try {
				MultipartRequest mr = //
						new MultipartRequest(req, // 요청정보
								saveDir, // 저장경로
								size, // 최대업로드 크기
								"UTF-8", // encoding
								new DefaultFileRenamePolicy()// 리네임 정책
						);
				String bookNo = mr.getParameter("bookNo");
				String bookTitle = mr.getParameter("bookTitle");
				
				String boardContent = mr.getParameter("boardContent");
				String boardSort = mr.getParameter("boardSort");
				String boardImage = mr.getFilesystemName("image");
				String boardTitle = mr.getParameter("boardTitle");
				
				String userId = mr.getParameter("userId");
				
				if(bookNo != null) {
					vo.setBookNo(Integer.parseInt(bookNo));					
				}
				if(boardTitle != null) {
					vo.setBoardTitle(boardTitle);
				} 
				else {
					vo.setBoardTitle(bookTitle);
				}
				
				if(boardContent != null) {
					vo.setBoardContent(boardContent);
				}
				if(userId != null) {
					vo.setUserId(userId);
				}
				
				vo.setBoardSort(boardSort);
				vo.setBoardImage(boardImage);					
				
				vo.setReviewStar(0); // 별점
				vo.setBoardCnt(0);  //조회수
				
				System.out.println("content:" +boardContent+ "sort:"+boardSort+"id:"+userId+"image:"+boardImage);
				
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}

		} // end of if

		BoardService svc = new BoardServiceImpl();
		if(svc.addBoard(vo)) {
			switch(vo.getBoardSort()) {
				case "QnA게시판":
					try {
						resp.sendRedirect("qnaBoard.do");
					} catch (IOException e) {
						e.printStackTrace();
					}
					break;
				case "리뷰게시판":
					try{
						resp.sendRedirect("bookReview.do");
					} catch (IOException e) {
						e.printStackTrace();
					}
					break;
				case "공지사항":
					try {
					 	resp.sendRedirect("bookNotice.do");
					} catch (IOException e) {
						e.printStackTrace();
					}
					break;
					
			}
		} else {
			try {
				resp.sendRedirect("bookBoardForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	} // end of execute

}
