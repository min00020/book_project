package co.yedam.book.service;

import java.util.List;

public interface BookService {
	public List<BookVO> bookList();    //전체
	public BookVO getBook(String bookvo);
	public List<BookVO> getBookInfo(); //상세
	
}
