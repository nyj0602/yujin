package forgotidpw;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;


public class SendSMSHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "/WEB-INF/view/forgot_idpw/FindBlank.jsp";
	}
}