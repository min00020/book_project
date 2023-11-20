package co.yedam.admin.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.admin.service.AdminService;
import co.yedam.admin.serviceImpl.AdminServiceImpl;
import co.yedam.common.Command;

public class ChartGenderControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		AdminService adsvc = new AdminServiceImpl();
		List<Map<String, Object>> userGender = adsvc.userGender();

		System.out.println("chartGenderCont:"+userGender);
		
		Gson gson = new GsonBuilder().create();
		resp.setContentType("text/json;charset=UTF-8");

		try {
			resp.getWriter().print(gson.toJson(userGender));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
