package co.yedam.user.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.user.service.UserService;
import co.yedam.user.service.UserVO;
import co.yedam.user.serviceImpl.UserServiceImpl;

public class MypageControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("id");
		UserService svc = new UserServiceImpl();
		UserVO vo = svc.getUser(id);
		req.setAttribute("vo", vo);
		
		String path = "WEB-INF/main/mypage.jsp";
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
