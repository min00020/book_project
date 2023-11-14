package co.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.user.web.JoinControl;
import co.yedam.user.web.JoinFormControl;
import co.yedam.user.web.LoginControl;
import co.yedam.user.web.LoginFormControl;
import co.yedam.user.web.LogoutControl;

public class FrontController extends HttpServlet {

	// init > service
	Map<String, Command> map = new HashMap<>();

	@Override
	public void init(ServletConfig config) throws ServletException {
		
		map.put("/loginForm.do", new LoginFormControl()); /* 로그인 화면 */
		map.put("/login.do", new LoginControl()); /* 로그인 처리 */
		map.put("/logoutForm.do", new LogoutControl()); /* 로그아웃 */
		map.put("/joinForm.do", new JoinFormControl()); /* 회원가입 화면 */ 
		map.put("/join.do", new JoinControl()); /* 회원가입 처리 */
	}

	@Override //호출할 때마다 실행하는건 서비스, init은 처음에만 실행
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		System.out.println("FrontController");
		String uri = req.getRequestURI();
		String context = req.getServletContext().getContextPath(); 
		String page = uri.substring(context.length()); 
		System.out.println(page); 
		
		Command controller = map.get(page);
		System.out.println(page);
		controller.execute(req, resp);

	}
}
