package co.yedam.admin.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.admin.service.AdminOrderService;
import co.yedam.admin.serviceImpl.AdminOrderServiceImpl;
import co.yedam.common.Command;

public class DeleteBookControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String bno = req.getParameter("bno");
		System.out.println("deleBookCont:"+ bno);
		
		AdminOrderService svc = new AdminOrderServiceImpl();
		
		if(svc.deleteBook(Integer.parseInt(bno))) {
			try {
				resp.getWriter().print("{\"retCode\" : \"OK\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.getWriter().print("{\"retCode\" : \"NG\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
