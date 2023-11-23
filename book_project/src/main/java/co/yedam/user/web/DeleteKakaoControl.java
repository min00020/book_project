package co.yedam.user.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Command;
import co.yedam.user.service.KakaoService;
import co.yedam.user.service.kakaoVO;
import co.yedam.user.serviceImpl.KakaoServiceImpl;

public class DeleteKakaoControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String kakaoId = req.getParameter("kakaoId");
		String kakaoPw = req.getParameter("kakaoPw");
		
		HttpSession session = req.getSession();
		session.setAttribute("kakaoId", kakaoId);
		session.setAttribute("kakaoPw", kakaoPw);
		
		KakaoService svc = new KakaoServiceImpl();
		
		if(svc.delete(kakaoId, kakaoPw)) {
			try {
				resp.sendRedirect("main.do");
				req.getSession().invalidate();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.sendRedirect("mypage.do?=kakaooutSuccess"+false);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		

	}

}
