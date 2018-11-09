package talent_register;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;

public class Page2Handler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		/*String title = request.getParameter("gtitleInput");
		
		request.setAttribute("gtitleInput", title);*/
		
		return "/WEB-INF/view/talent_register/insert_second.jsp";
	}

}
