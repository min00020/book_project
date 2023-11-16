package co.yedam.admin.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.admin.mapper.AdminMainMapper;
import co.yedam.admin.service.AdminService;
import co.yedam.admin.serviceImpl.AdminServiceImpl;
import co.yedam.book.service.BookService;
import co.yedam.book.service.BookVO;
import co.yedam.book.serviceImpl.BookServiceImpl;
import co.yedam.common.Command;
import co.yedam.order.service.OrderVO;

public class AdminControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String path = "admin/adminpage.tiles";

		AdminService adsvc = new AdminServiceImpl();
		
		int sysmonthPrice = adsvc.sysmonthPrice();
		req.setAttribute("sysmonthPrice", sysmonthPrice);
		
		int totalPriceSum = adsvc.totalPriceSum();
		req.setAttribute("totalPriceSum", totalPriceSum);
		
		int orderPercent = adsvc.orderPercent();
		req.setAttribute("orderPercent", orderPercent);
		
//		List<Map<String, Object>> orderMonth = adsvc.monthPrice();
//		req.setAttribute("orderMonth", orderMonth);

		int orderCnt = adsvc.orderCnt();
		req.setAttribute("orderCnt", orderCnt);
		
		int reqDelivery = adsvc.reqDelivery();
		req.setAttribute("reqDelivery", reqDelivery);

		System.out.println("admincontrol조회:" + orderCnt);
		System.out.println(totalPriceSum);

		try {
			req.getRequestDispatcher(path).forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
