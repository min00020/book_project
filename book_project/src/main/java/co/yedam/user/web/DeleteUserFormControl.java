package co.yedam.user.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Command;
import co.yedam.user.service.UserService;
import co.yedam.user.service.UserVO;
import co.yedam.user.serviceImpl.UserServiceImpl;

public class DeleteUserFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "WEB-INF/main/deleteuserForm.jsp";
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		HttpSession session = req.getSession();
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
