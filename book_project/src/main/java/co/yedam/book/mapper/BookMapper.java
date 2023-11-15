package co.yedam.book.mapper;

import java.util.List;

import co.yedam.book.service.BookVO;

public interface BookMapper {
	public List<BookVO> bkList();
	public BookVO getBk(String bookvo); //상세
	public List<BookVO> getBkInfo(); 
	
	public List<BookVO> bkshop(); // 북샵
}
