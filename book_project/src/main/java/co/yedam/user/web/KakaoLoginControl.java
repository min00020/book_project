package co.yedam.user.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Command;
import co.yedam.user.service.UserService;
import co.yedam.user.service.kakaoVO;
import co.yedam.user.serviceImpl.UserServiceImpl;

public class KakaoLoginControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		 String accessToken = req.getParameter("token"); 
		 kakaoVO vo = new kakaoVO();
		 
		 Map<String, Object> map = new HashMap<>(); 
		 UserService svc = new UserServiceImpl();

		 Gson gson = new GsonBuilder().create(); 
		 try {
			 resp.getWriter().print(gson.toJson(map)); 
		 } catch (IOException e) {
			 e.printStackTrace(); }
		 


	}

}
