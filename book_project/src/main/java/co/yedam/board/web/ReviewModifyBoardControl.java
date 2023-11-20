package co.yedam.board.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.yedam.board.service.BoardService;
import co.yedam.board.service.BoardVO;
import co.yedam.board.serviceImpl.BoardServiceImpl;
import co.yedam.common.Command;

public class ReviewModifyBoardControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// 파라메타활용 -> 데이터수정 -> 목록이동.
		BoardVO vo = new BoardVO();
		if (req.getMethod().equals("get")) {


		} else if (req.getMethod().equals("POST")) {
			String saveDir = req.getServletContext().getRealPath("images");
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
				
				String bno = mr.getParameter("bno");	
				String boardTitle = mr.getParameter("boardTitle");
				String boardContent = mr.getParameter("boardContent");
				String boardImage = mr.getFilesystemName("boardImage");

				vo.setBoardNo(Integer.parseInt(bno));
				vo.setBoardTitle(boardTitle);
				vo.setBoardContent(boardContent);
				vo.setBoardImage(boardImage);

			} catch (IOException e) {
				e.printStackTrace();
			}

		} // end of if

		BoardService svc = new BoardServiceImpl();
		if (svc.editBoard(vo)) {
			try {
				resp.sendRedirect("qnaBoard.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.sendRedirect("reviewModifyForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}

}
