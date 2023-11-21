package co.yedam.user.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.user.service.KakaoService;
import co.yedam.user.service.kakaoVO;
import co.yedam.user.serviceImpl.KakaoServiceImpl;

public class KakaoIdCheckControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String kakaoId = req.getParameter("kakaoId");
		
		System.out.println("kakaoId: " + kakaoId);
		
		KakaoService svc = new KakaoServiceImpl();
		kakaoVO kvo;
		kvo = svc.IdCheck(kakaoId);
		
		
		
		String result= "";
		
		if (kvo == null) {
			result = "{\"retCode\":\"OK\"}";
		} else {
			result = "{\"retCode\":\"NG\"}";
		}
		
		System.out.println(result);
		try {
			resp.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
