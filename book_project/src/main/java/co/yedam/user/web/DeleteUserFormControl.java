package co.yedam.user.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;

public class DeleteUserFormControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "deleteuser.do";
		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
