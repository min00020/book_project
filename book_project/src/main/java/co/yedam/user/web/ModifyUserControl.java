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
		String pw = req.getParameter("pw1");
		String email = req.getParameter("email");
		String phone = req.getParameter("pnum");
		String addrnum = req.getParameter("postcode");
		String addr = req.getParameter("addr");
		
		vo.setUserId(id);
		vo.setUserPass(pw);
		vo.setUserEmail(email);
		vo.setUserPhone(phone);
		vo.setUserAddrnum(addrnum);
		vo.setUserAddr(addr);
		
		UserService svc = new UserServiceImpl();	
		
		 if (svc.editUser(vo)) { 
			 try { resp.sendRedirect("mypage.do?id="+id+"&modifySuccess="+true); 
			 } catch (IOException e) {
				 e.printStackTrace(); 
			 }
		 } else { 
			 try { resp.sendRedirect("modifyuserForm.do?id="+id+"&modifySuccess="+false); 
			 } catch (IOException e) {
				 e.printStackTrace(); } 
			 }
		 
	}
}

