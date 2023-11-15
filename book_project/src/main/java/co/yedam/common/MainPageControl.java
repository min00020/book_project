package co.yedam.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainPageControl implements Command {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		try {
			resp.sendRedirect("bookmainpage.do");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
