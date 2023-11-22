package co.yedam.user.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.user.service.UserVO;
import co.yedam.user.serviceImpl.UserServiceImpl;

public class DeleteUserControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("id");
		String pw = req.getParameter("pass");
		System.out.println("id:" + id);
		System.out.println("pw: " + pw);

		UserServiceImpl svc = new UserServiceImpl();

		if (svc.removeUser(id, pw)) {
			try {
				resp.sendRedirect("main.do");
				req.getSession().invalidate();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.sendRedirect("deleteuserForm.do?deleteSuccess="+false);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
