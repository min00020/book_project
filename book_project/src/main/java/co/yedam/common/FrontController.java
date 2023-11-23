package co.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.admin.web.AddBookControl;
import co.yedam.admin.web.AdminBookControl;
import co.yedam.admin.web.AdminChartControl;
import co.yedam.admin.web.AdminControl;
import co.yedam.admin.web.AdminOrderControl;
import co.yedam.admin.web.AdminOrderUpdate;
import co.yedam.admin.web.ChartGenderControl;
import co.yedam.admin.web.ChartMonthPriceCont;
import co.yedam.admin.web.DeleteBookControl;
import co.yedam.admin.web.InsertBookControl;
import co.yedam.admin.web.InstaControl;
import co.yedam.admin.web.UpdateBookControl;
import co.yedam.board.web.BookAddBoardControl;
import co.yedam.board.web.BookBoardFormControl;
import co.yedam.board.web.BookBoardListControl;
import co.yedam.board.web.BookGetBoardControl;
import co.yedam.board.web.BookNoticeControl;
import co.yedam.board.web.BookReviewControl;
import co.yedam.board.web.ReviewModifyBoardControl;
import co.yedam.board.web.ReviewModifyFormControl;
import co.yedam.board.web.QnaBoardControl;
import co.yedam.board.web.ReviewDetailControl;
import co.yedam.board.web.ReviewRemoveBoardControl;
import co.yedam.board.web.ReviewRemoveFormControl;
import co.yedam.book.web.BookInfoControl;
import co.yedam.book.web.BookInventoryControl;
import co.yedam.book.web.BookMainPageControl;
import co.yedam.book.web.BookSearchControl;
import co.yedam.book.web.BookShopControl;
import co.yedam.cart.web.AddCartControl;
import co.yedam.cart.web.CartListControl;
import co.yedam.cart.web.DeleteCartControl;
import co.yedam.cart.web.ModyfiCartControl;
import co.yedam.order.web.OrderListControl;
import co.yedam.reply.web.AddReplyControl;
import co.yedam.reply.web.DelReplyControl;
import co.yedam.reply.web.ReplyListControl;
import co.yedam.user.web.DeleteKakaoControl;
import co.yedam.user.web.DeleteUserControl;
import co.yedam.user.web.DeleteUserFormControl;
import co.yedam.user.web.FindUserControl;
import co.yedam.user.web.FindUserFormControl;
import co.yedam.user.web.FindPassControl;
import co.yedam.user.web.FindPassFormControl;
import co.yedam.user.web.IdCheckControl;
import co.yedam.user.web.JoinControl;
import co.yedam.user.web.JoinFormControl;
import co.yedam.user.web.KakaoIdCheckControl;
import co.yedam.user.web.KakaoJoinControl;
import co.yedam.user.web.LoginControl;
import co.yedam.user.web.LoginFormControl;
import co.yedam.user.web.LogoutControl;
import co.yedam.user.web.ModifyUserControl;
import co.yedam.user.web.ModifyUserFormControl;
import co.yedam.user.web.MypageControl;
import co.yedam.user.web.KakaoLoginControl;

public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	// init > service
	Map<String, Command> map = new HashMap<>();

	@Override
	public void init(ServletConfig config) throws ServletException {
		// 주문
		map.put("/orderListInfo.do", new OrderListControl()); // 장바구니 주문정보 불러오기
		// 장바구니 
		map.put("/cartListInfo.do", new CartListControl()); // 장바구니 목록
		map.put("/addCart.do", new AddCartControl()); // 장바구니 담기
		map.put("/deleteCart.do", new DeleteCartControl()); // 장바구니 삭제
		map.put("/modifyCart.do", new ModyfiCartControl()); // 장바구니 수량수정
		
		//강현진
		map.put("/main.do", new MainPageControl());        //메인 페이지로 가기
		map.put("/bookmainpage.do", new BookMainPageControl()); //메인 페이지
		map.put("/bookInfo.do", new BookInfoControl());   //책 상세 페이지
		map.put("/bookshop.do", new BookShopControl());   //북 샵
		map.put("/booksearch.do", new BookSearchControl()); //검색 기능
		map.put("/bookInventory.do", new BookInventoryControl()); // 목록 불러오기 기능
		
		map.put("/qnaBoard.do", new QnaBoardControl()); // qna 게시판
		map.put("/bookReview.do", new BookReviewControl()); // 책 리뷰 게시판
		map.put("/bookNotice.do", new BookNoticeControl()); // 공지사항
		map.put("/reviewDetail.do", new ReviewDetailControl()); // 상세페이지 리뷰
		// 목록 화면
		map.put("/bookBoardList.do", new BookBoardListControl()); // 댓글 목록
		map.put("/bookGetBoard.do", new BookGetBoardControl());   // 상세 목록
		//리뷰 등록화면
		map.put("/bookBoardForm.do", new BookBoardFormControl()); // 게시글 등록 화면
		map.put("/bookAddBoard.do", new BookAddBoardControl());   // 댓글 등록 데이터 처리
		//리뷰 수정 화면
		map.put("/reviewModifyForm.do", new ReviewModifyFormControl());  //  게시글 수정
		map.put("/reviewModifyBoard.do", new ReviewModifyBoardControl());  // 게시글 수정 데이터 처리
		//리뷰 삭제
		map.put("/reviewRemoveForm.do", new ReviewRemoveFormControl());		  // 게시글 삭제
		map.put("/reviewRemoveBoard.do", new ReviewRemoveBoardControl());     // 게시글 삭제
		//댓글목록.
		map.put("/replyList.do", new ReplyListControl());
		map.put("/addReply.do", new AddReplyControl());
		map.put("/delReply.do", new DelReplyControl());
		
		// 로그인 & 회원가입
		map.put("/loginForm.do", new LoginFormControl()); /* 로그인 화면 */
		map.put("/login.do", new LoginControl()); /* 로그인 처리 */
		map.put("/logoutForm.do", new LogoutControl()); /* 로그아웃 */
		map.put("/joinForm.do", new JoinFormControl()); /* 회원가입 화면 */ 
		map.put("/join.do", new JoinControl()); /* 회원가입 처리 */
		map.put("/idCheck.do", new IdCheckControl()); /* 아이디 중복 확인 */
		
		// 마이 페이지
		map.put("/modifyuser.do", new ModifyUserControl()); /* 회원 정보 수정 처리 */
		map.put("/modifyuserForm.do", new ModifyUserFormControl()); /* 회원 정보 수정 화면 */
		map.put("/mypage.do", new MypageControl()); /* 마이 페이지 */
		map.put("/deleteuser.do", new DeleteUserControl()); /* 회원 탈퇴 */
		map.put("/deleteuserForm.do", new DeleteUserFormControl()); /* 회원 탈퇴 */
		
		// 카카오 api
		map.put("/kakaologin.do", new KakaoLoginControl()); /* 카카오 로그인 처리*/
		map.put("/kakaoIdCheck.do", new KakaoIdCheckControl()); /* 카카오 로그인 처리*/
		map.put("/kakaojoin.do", new KakaoJoinControl()); /* 카카오 회원가입 */
		map.put("/deletekakao.do", new DeleteKakaoControl()); /* 카카오 회원 탈퇴 */
		
		// 로그인 부가기능
		map.put("/finduser.do", new FindUserControl()); /* 아이디 찾기 */
		map.put("/finduserForm.do", new FindUserFormControl()); /* 아이디 찾기 화면 */
		map.put("/findpass.do", new FindPassControl()); /* 비밀번호 찾기 */
		map.put("/findpassForm.do", new FindPassFormControl()); /* 비밀번호 찾기 화면 */
		
		//관리자
		map.put("/admin.do", new AdminControl()); //관리자 메인페이지
		map.put("/chartMonthPrice.do", new ChartMonthPriceCont()); //월별 판매금액 차트
		map.put("/chartGender.do", new ChartGenderControl()); //성별통계
		
		map.put("/adminChart.do", new AdminChartControl()); //차트 페이지
		
		map.put("/adminOrder.do", new AdminOrderControl()); //주문목록확인
		map.put("/adminOrderUpdate.do", new AdminOrderUpdate()); //주문상태 변경
		//도서추가
		map.put("/adminBook.do", new AdminBookControl()); //도서 상품목록 페이지
		map.put("/insertBook.do", new InsertBookControl());//상품 등록 페이지
		map.put("/addBook.do", new AddBookControl()); //도서 추가
		map.put("/updateBook.do", new UpdateBookControl() );//도서 수정)
		map.put("/deleteBook.do", new DeleteBookControl() );//도서 수정
		
		//인스타
		map.put("/insta.do", new InstaControl());

	}

	@Override //호출할 때마다 실행하는건 서비스, init은 처음에만 실행
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		System.out.println("FrontController");
		String uri = req.getRequestURI();
		String context = req.getServletContext().getContextPath(); 
		String page = uri.substring(context.length()); 
		System.out.println("프론트: "+page);
		
		Command controller = map.get(page);
		System.out.println("프론트: "+page);
		controller.execute(req, resp);
		
	}
}
