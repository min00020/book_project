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

public class UpdateBookControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		BookVO vo = new BookVO();
		resp.setContentType("text/json;charset=UTF-8");
		
		if (req.getMethod().equals("get")) {
			
			//String title = req.getParameter("title");
			String writer = req.getParameter("writer");
			String publisher = req.getParameter("publisher");
			String content = req.getParameter("content");
			String price = req.getParameter("price");
			String cnt = req.getParameter("cnt");
			String sort = req.getParameter("sort");

			//vo.setBookTitle(title);
			vo.setBookSort(sort);
			vo.setBookWriter(writer);
			vo.setBookPublisher(publisher);
			vo.setBookPrice(Integer.parseInt(price));
			vo.setBookCnt(Integer.parseInt(cnt));
			vo.setBookContent(content);

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
				
				String bno = mr.getParameter("bno");
				//String title = mr.getParameter("title");
				String sort = mr.getParameter("sort");
				String writer = mr.getParameter("writer");
				String publisher = mr.getParameter("publisher");
				String price = mr.getParameter("price");
				String cnt = mr.getParameter("cnt");
				String content = mr.getParameter("content");
				//String img = mr.getFilesystemName("img");
				
				vo.setBookNo(Integer.parseInt(bno));
				//vo.setBookTitle(title);
				vo.setBookSort(sort);
				vo.setBookWriter(writer);
				vo.setBookPublisher(publisher);
				vo.setBookPrice(Integer.parseInt(price));
				vo.setBookCnt(Integer.parseInt(cnt));
				vo.setBookContent(content);
				//vo.setBookImage(img);
				System.out.println("updateBookCont:"+ vo);
				
			} catch (IOException e) {
				e.printStackTrace();
			}

		} // end of if

		AdminOrderService svc = new AdminOrderServiceImpl();
		if (svc.updateBook(vo)) {
			try {
				resp.sendRedirect("adminBook.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} 
		
	}

}
