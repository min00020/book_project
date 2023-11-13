package co.yedam.book.mapper;

import java.util.List;

import co.yedam.book.service.BookVO;

public interface BookMapper {
	public List<BookVO> bkList();
	public BookVO getBk(String bookvo);
	public List<BookVO> getBkInfo(); //상세
}
