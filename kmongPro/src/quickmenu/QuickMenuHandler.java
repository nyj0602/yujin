package quickmenu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;

public class QuickMenuHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("여기까지");
		String sessionID = request.getParameter("sessionID");
		//sessionID = (String) request.getSession().getAttribute("authUser");
		System.out.println("퀵메뉴핸들러세션"+sessionID);
		if(sessionID == null) {
			return "/WEB-INF/view/login/login.jsp";
		}
		request.setAttribute("sessionID", sessionID);
		return "/WEB-INF/view/inc/QuickMenu/QuickMenuModuel.jsp";
	}
	
}
