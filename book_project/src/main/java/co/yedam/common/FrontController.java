package co.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.admin.web.AdminControl;
import co.yedam.admin.web.ChartMonthPriceCont;
import co.yedam.admin.web.InstaControl;
import co.yedam.book.web.BookInfoControl;
import co.yedam.book.web.BookInventoryControl;
import co.yedam.book.web.BookMainPageControl;
import co.yedam.book.web.BookSearchControl;
import co.yedam.book.web.BookShopControl;
import co.yedam.cart.web.AddCartControl;
import co.yedam.cart.web.CartListControl;
import co.yedam.cart.web.DeleteCartControl;
import co.yedam.order.web.OrderListControl;
import co.yedam.user.web.IdCheckControl;
import co.yedam.user.web.JoinControl;
import co.yedam.user.web.JoinFormControl;
import co.yedam.user.web.LoginControl;
import co.yedam.user.web.LoginFormControl;
import co.yedam.user.web.LogoutControl;
import co.yedam.user.web.ModifyFormControl;
import co.yedam.user.web.ModifyUserControl;
import co.yedam.user.web.MypageControl;

public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	// init > service
	Map<String, Command> map = new HashMap<>();

	@Override
	public void init(ServletConfig config) throws ServletException {
		// 주문
		map.put("/orderListInfo.do", new OrderListControl());

		// 장바구니 
		map.put("/cartListInfo.do", new CartListControl()); // 장바구니 목록
		map.put("/addCart.do", new AddCartControl()); // 장바구니 담기
		map.put("/deleteCart.do", new DeleteCartControl()); // 장바구니 삭제
		
		//강현진
		map.put("/main.do", new MainPageControl());        //메인 페이지로 가기
		map.put("/bookmainpage.do", new BookMainPageControl()); //메인 페이지
		map.put("/bookInfo.do", new BookInfoControl());   //책 상세 페이지
		map.put("/bookshop.do", new BookShopControl());   //북 샵
		map.put("/booksearch.do", new BookSearchControl()); //검색 기능
		map.put("/bookInventory", new BookInventoryControl()); // 목록 불러오기 기능
		
//		map.put("/addBoard.do", new AddBoardControl());
		
		map.put("/loginForm.do", new LoginFormControl()); /* 로그인 화면 */
		map.put("/login.do", new LoginControl()); /* 로그인 처리 */
		map.put("/logoutForm.do", new LogoutControl()); /* 로그아웃 */
		map.put("/joinForm.do", new JoinFormControl()); /* 회원가입 화면 */ 
		map.put("/join.do", new JoinControl()); /* 회원가입 처리 */
		map.put("/idCheck.do", new IdCheckControl()); /* 아이디 중복 확인 */

		map.put("/modifyuser.do", new ModifyUserControl()); /* 회원 정보 수정 처리 */
		map.put("/modifyForm.do", new ModifyFormControl()); /* 회원 정보 수정 화면 마이페이지 생성하면 필요한지 모르겠음*/
		map.put("/mypage.do", new MypageControl()); /* 마이 페이지 */
		
		
		//관리자
		map.put("/admin.do", new AdminControl());
		map.put("/chartMonthPrice.do", new ChartMonthPriceCont()); /*월별 판매금액 차트*/
		
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
