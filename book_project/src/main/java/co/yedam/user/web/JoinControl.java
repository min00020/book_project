package co.yedam.user.web;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.user.service.UserService;
import co.yedam.user.service.UserVO;
import co.yedam.user.serviceImpl.UserServiceImpl;


public class JoinControl implements Command {
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
				
		String id = req.getParameter("id");
		String pw = req.getParameter("pw1");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String email2 = req.getParameter("emaildomain");
		
		String phone = req.getParameter("pnum");
		String addrnum = req.getParameter("postcode");
		String addr = req.getParameter("addr");
		String bir1 = req.getParameter("bir1");
		String bir2 = req.getParameter("bir2");
		String bir3 = req.getParameter("bir3");
		String gender = req.getParameter("gender");

		String domain = (email.concat(email2));
		String bir = (bir1.concat(bir2).concat(bir3));

		
		UserVO vo = new UserVO();
		
		vo.setUserId(id);
		vo.setUserPass(pw);
		vo.setUserName(name);
		vo.setUserEmail(domain);
		vo.setUserPhone(phone);
		vo.setUserAddrnum(addrnum);
		vo.setUserAddr(addr);
		vo.setUserBir(bir);
		vo.setUserGender(gender);
		
		UserService svc = new UserServiceImpl();
		
		if (svc.addUser(vo)) {

			/*
			 * try { // resp.sendRedirect("main.do"); } catch (IOException e) {
			 * e.printStackTrace(); }
			 */

			try { resp.sendRedirect("main.do"); 
			} catch (IOException e) {
			 e.printStackTrace(); 
			 }

		} else {
			try {
				resp.sendRedirect("joinForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}