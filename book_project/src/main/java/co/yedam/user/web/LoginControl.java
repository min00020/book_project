package co.yedam.user.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Command;
import co.yedam.user.service.UserService;
import co.yedam.user.service.UserVO;
import co.yedam.user.serviceImpl.UserServiceImpl;

public class LoginControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("userId");
		String pw = req.getParameter("userPass");
		
		UserService svc = new UserServiceImpl();
		UserVO vo;
		vo = svc.loginCheck(id, pw);
		
		if (vo != null) {
			HttpSession session = req.getSession();
			session.setAttribute("userId", id);
			session.setAttribute("resposbility", vo.getResponsbility());
			
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		

	}

}
