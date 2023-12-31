package co.yedam.user.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.user.service.UserService;
import co.yedam.user.service.UserVO;
import co.yedam.user.serviceImpl.UserServiceImpl;

public class IdCheckControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("id");

		UserService svc = new UserServiceImpl();
		UserVO vo;
		vo = svc.IdCheck(id);
		
		System.out.println("id: " + id);
		
		String result = "";
		
		if (vo == null) {
			result = "{\"retCode\":\"OK\"}";
		} else {
			result = "{\"retCode\":\"NG\"}";
		}
		
		System.out.println(result);
		try {
			resp.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
