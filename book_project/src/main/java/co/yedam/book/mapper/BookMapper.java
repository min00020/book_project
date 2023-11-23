package co.yedam.book.mapper;

import java.util.List;

import co.yedam.book.service.BookVO;

public interface BookMapper {
	public List<BookVO> bkList();
	public BookVO getBk(String bookTitle); //상세
	public List<BookVO> getBkInfo(); 
	public List<BookVO> bkshop(); // 북샵
	public List <BookVO> bkserch(String bookTitle); // 검색기능
	
	
	public List<BookVO> invenbook(String type); // 책 분류
	
	public List<BookVO> joinBoardList(); //테이블 조인 book = board
//	public String getkeyword();
//	public void setKeyword(String keyword);
}
