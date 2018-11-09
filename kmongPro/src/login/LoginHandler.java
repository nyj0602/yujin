package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;

public class LoginHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String messageGo = request.getParameter("messageGo");
		System.out.println("message :"+messageGo);
		request.setAttribute("messageGo", messageGo);
		return "/WEB-INF/view/login/login.jsp";
	}

}
