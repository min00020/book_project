package co.yedam.user.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.common.Command;
import co.yedam.user.service.KakaoService;
import co.yedam.user.service.kakaoVO;
import co.yedam.user.serviceImpl.KakaoServiceImpl;

public class KakaoJoinControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String kakaoId = req.getParameter("kakaoId");
		String kakaoPw = req.getParameter("kakaoPw");
		
		kakaoVO kvo = new kakaoVO();
		
		kvo.setKakaoId(kakaoId);
		kvo.setKakaoPw(kakaoPw);
		
		KakaoService svc = new KakaoServiceImpl();
		
		if (svc.addKakaoUser(kvo)) {
			try {
				resp.sendRedirect("loginForm.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.sendRedirect("loginForm.do");
				resp.getWriter().print("카카오 회원 가입 실패");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
