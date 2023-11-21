package co.yedam.admin.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.yedam.admin.service.AdminOrderService;
import co.yedam.admin.serviceImpl.AdminOrderServiceImpl;
import co.yedam.book.service.BookVO;
import co.yedam.common.Command;

public class AddBookControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		BookVO vo = new BookVO();
		resp.setContentType("text/json;charset=UTF-8");
		
		if (req.getMethod().equals("get")) {
			
			String title = req.getParameter("title");
			String writer = req.getParameter("writer");
			String publisher = req.getParameter("publisher");
			String content = req.getParameter("content");
			String price = req.getParameter("price");
			String cnt = req.getParameter("cnt");
			String sort = req.getParameter("sort");

			vo.setBookTitle(title);
			vo.setBookWriter(writer);
			vo.setBookPublisher(publisher);
			vo.setBookContent(content);
			vo.setBookPrice(Integer.parseInt(price));
			vo.setBookCnt(Integer.parseInt(cnt));
			vo.setBookSort(sort);
			

		} else if (req.getMethod().equals("POST")) {
			String saveDir = req.getServletContext().getRealPath("resources/image");
			int size = 5 * 500 * 500;
			try {
				MultipartRequest mr = //
						new MultipartRequest(req, // 요청정보
								saveDir, // 저장경로
								size, // 최대업로드 크기
								"UTF-8", // encoding
								new DefaultFileRenamePolicy()// 리네임 정책
						);
				
				String title = mr.getParameter("title");
				String writer = mr.getParameter("writer");
				String publisher = mr.getParameter("publisher");
				String content = mr.getParameter("content");
				String price = mr.getParameter("price");
				String cnt = mr.getParameter("cnt");
				String sort = mr.getParameter("sort");
				String img = mr.getFilesystemName("img");
				
				vo.setBookTitle(title);
				vo.setBookWriter(writer);
				vo.setBookPublisher(publisher);
				vo.setBookContent(content);
				vo.setBookPrice(Integer.parseInt(price));
				vo.setBookCnt(Integer.parseInt(cnt));
				vo.setBookSort(sort);
				vo.setBookImage(img);
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}

		} // end of if

		AdminOrderService svc = new AdminOrderServiceImpl();
		if (svc.addBook(vo)) {
			try {
				resp.sendRedirect("adminBook.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.sendRedirect("insertBook.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}
