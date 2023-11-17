package co.yedam.user.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.user.service.UserService;
import co.yedam.user.service.UserVO;
import co.yedam.user.serviceImpl.UserServiceImpl;

public class ModifyFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("id");
		System.out.println(id);
		UserService svc = new UserServiceImpl();
		UserVO vo = svc.getUser(id);
		
		System.out.print("ModifyFormControl.java id= " + id);
		req.setAttribute("vo", vo);
		System.out.println(vo);
		
		try {
			req.getRequestDispatcher("WEB-INF/main/modifyForm.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
