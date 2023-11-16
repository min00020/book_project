package co.yedam.common;

public class PageDTO {
	int total; // 전체건수.
	int currentPage; //현재 페이지.
	boolean next, prev; // 이전, 이후.
	int startPage , endPage;
	int boardNo; //어떠한 페이지 값
//  51page  51page.	~ 52page. 258건. 52page 까지 나오겠지
	public PageDTO(int boardNo, int total, int currentPage) {
		this.currentPage = currentPage;
		
		int realEnd = (int) Math.ceil(total / 5.0);
		
		this.boardNo = boardNo;
		this.total = total;
		
		
		this.endPage = (int) Math.ceil(currentPage / 10.0) * 10;
		this.startPage = this.endPage - 9;
		
		this.endPage = this.endPage > realEnd ? realEnd : this.endPage; //리얼 엔드 페이지와 비교를 해서 마지막 페이지가 나오게 
		
		this.prev = this.startPage > 1;  //이전페이지가 있다는 뜻
		this.next = this.endPage < realEnd; //이후페이지가 있다는 뜻
		
	}
	
	
	
}
