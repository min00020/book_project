package co.yedam.user.web;

import java.io.Console;
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
		String id = req.getParameter("id");
		String pw = req.getParameter("pass");
		
		UserService svc = new UserServiceImpl();
		UserVO vo;
		vo = svc.loginCheck(id, pw);
		
		if (vo != null) {
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
			session.setAttribute("pass", pw);
			session.setAttribute("responsibility", vo.getResponsibility());
			
			
			try {
				resp.sendRedirect("main.do");
				System.out.println("성공");
				System.out.println("아이디: " + id + "비밀번호: " +  pw);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.sendRedirect("loginForm.do");
				System.out.println("실패");
				System.out.println("아이디: " + id + "비밀번호: " +  pw);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		

	}

}