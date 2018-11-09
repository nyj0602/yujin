package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LogoutHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

/*		if("HTTP/1.1".equals(request.getProtocol())) {

			response.setHeader ("Cache-Control", "no-cache, no-store, must-revalidate");

		} else {

			response.setHeader ("Pragma", "no-cache");

		}

		response.setDateHeader ("Expires", 0);*/
		

	
		String user = (String) request.getSession().getAttribute("authUser");
		return "/WEB-INF/view/main/main.jsp";
	}

}
