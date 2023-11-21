package co.yedam.user.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Command;
import co.yedam.user.service.KakaoService;
import co.yedam.user.service.kakaoVO;
import co.yedam.user.serviceImpl.KakaoServiceImpl;

public class KakaoLoginControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		 String kakaoId = req.getParameter("kakaoId");
		 String kakaoPw = req.getParameter("kakaoPw");
		 
		 System.out.println("kakao id, pw : "+ kakaoId + kakaoPw);
		 
		 kakaoVO kvo = new kakaoVO();
		 KakaoService svc = new KakaoServiceImpl();
		 kvo = svc.loginCheck(kakaoId, kakaoPw);
		 System.out.println(kvo);
		 
		 if (kvo != null) {
				HttpSession session = req.getSession();
				session.setAttribute("kakaoId", kakaoId);
				session.setAttribute("kakaoPw", kakaoPw);
		
		 try {
			 resp.sendRedirect("main.do");
			 System.out.println("카카오 로그인 성공");
		 } catch (IOException e) {
			 e.printStackTrace(); 
			 }
		 } else {
			 try {
				resp.sendRedirect("loginForm.do");
				System.out.println("카카오 로그인 실패");
			} catch (IOException e) {
				e.printStackTrace();
			}
		 }

	}
}
