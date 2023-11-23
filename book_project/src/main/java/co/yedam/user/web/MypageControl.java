package co.yedam.user.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.board.service.BoardVO;
import co.yedam.common.Command;
import co.yedam.order.service.OrderVO;
import co.yedam.user.service.UserOrderService;
import co.yedam.user.service.UserService;
import co.yedam.user.service.UserVO;
import co.yedam.user.serviceImpl.UserOrderServiceImpl;
import co.yedam.user.serviceImpl.UserServiceImpl;

public class MypageControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// 마이페이지
		String id = req.getParameter("id");
		UserService svc = new UserServiceImpl();
		UserVO vo = svc.getUser(id);
		req.setAttribute("vo", vo);
		
		// 회원별 주문 목록 조회
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("id");
		
		System.out.println("id: "+ userid);
		
		UserOrderService usvc = new UserOrderServiceImpl();
		
		List<OrderVO> list = usvc.selectorder(userid);
		System.out.println("주문목록 list: "+list);
		
		req.setAttribute("list", list);
		
		// 회원별 게시글 목록 조회// 회원별 qna 게시글 목록
		List<BoardVO> qlist = usvc.selectqna(userid);
		req.setAttribute("qlist", qlist);
		
		// 회원별 리뷰 게시글 목록;
		List<BoardVO> rlist = usvc.selectreview(userid);
		req.setAttribute("rlist", rlist);
		
		
		String path = "WEB-INF/main/mypage.jsp";
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
