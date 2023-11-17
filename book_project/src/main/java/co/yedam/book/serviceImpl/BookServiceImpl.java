package co.yedam.book.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.book.mapper.BookMapper;
import co.yedam.book.service.BookService;
import co.yedam.book.service.BookVO;
import co.yedam.common.DataSourceMybatis;

public class BookServiceImpl implements BookService {
	private SqlSession sql = DataSourceMybatis.getInstance().openSession(true);
	private BookMapper mapper = sql.getMapper(BookMapper.class);
	
	@Override
	public List<BookVO> bookList() {
		return mapper.bkList();
	}

	@Override
	public BookVO getBook(String bookvo) {
		return mapper.getBk(bookvo);
	}

	@Override
	public List<BookVO> selectBook() {
		return mapper.getBkInfo();
	}

	@Override
	public List<BookVO> bookshop() {
		return mapper.bkshop();
	}

	@Override
	public List<BookVO> bookserch(String bookTitle) {
		return mapper.bkserch(bookTitle);
	}

	@Override
	public List<BookVO> invenbook(int type) {
		return mapper.invenbook(type);
	}

}
