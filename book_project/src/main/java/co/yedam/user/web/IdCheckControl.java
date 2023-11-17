package co.yedam.user.web;

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
		UserVO vo = svc.IdCheck(id);
		
		if (vo == null) {
			System.out.println("retcode:OK");
		} else {
			System.out.println("retcode:NG");
		}

	}

}
