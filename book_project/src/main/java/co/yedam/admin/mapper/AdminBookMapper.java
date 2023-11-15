package co.yedam.admin.mapper;

import java.util.List;

import co.yedam.book.service.BookVO;

public interface AdminBookMapper {
	public List<BookVO> bkList();
	public BookVO getBk(String bookvo); //상세
	public List<BookVO> getBkInfo(); 
	
	public List<BookVO> bkshop(); // 북샵
}
