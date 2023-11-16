package co.yedam.admin.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.admin.mapper.AdminMainMapper;
import co.yedam.admin.service.AdminService;
import co.yedam.admin.serviceImpl.AdminServiceImpl;
import co.yedam.common.Command;

public class ChartMonthPriceCont implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		AdminService adsvc = new AdminServiceImpl();
		List<Map<String, Object>> orderMonth = adsvc.monthPrice();
		System.out.println("admincontroll주문건수:" + orderMonth);

		Gson gson = new GsonBuilder().create();

		try {
			resp.getWriter().print(gson.toJson(orderMonth));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
