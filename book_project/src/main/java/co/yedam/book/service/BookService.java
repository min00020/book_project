package co.yedam.book.service;

import java.util.List;

public interface BookService {
	public List<BookVO> bookList();    //전체
	public BookVO getBook(String bookTitle); // 상세
	public List<BookVO> selectBook(); //
	public List<BookVO> bookshop(); // 북샵
	public List <BookVO> bookserch(String bookTitle); // 검색기능
	public List<BookVO> invenbook(String type); // 책 분류
	
	public List<BookVO> joinBoardList(); //테이블 조인 book = board
	

	
	
}
