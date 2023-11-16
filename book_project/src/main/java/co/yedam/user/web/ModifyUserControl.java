package co.yedam.user.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Command;
import co.yedam.user.service.UserService;
import co.yedam.user.service.UserVO;
import co.yedam.user.serviceImpl.UserServiceImpl;

public class ModifyUserControl implements Command {
	UserVO vo = new UserVO();
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String phone = req.getParameter("phone");
		String addrnum = req.getParameter("addrnum");
		String addr = req.getParameter("addr");
		
		vo.setUserId(id);
		vo.setUserPass(pw);
		vo.setUserPhone(phone);
		vo.setUserAddrnum(addrnum);
		vo.setUserAddr(addr);
		
		UserService svc = new UserServiceImpl();
		
//		HttpSession session = req.getSession();
		
		if (svc.editUser(vo)) {
			try {
				resp.sendRedirect("modifyForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} else {
			try {
				resp.sendRedirect("modifyForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
