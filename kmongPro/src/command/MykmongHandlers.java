package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MykmongHandlers implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		return "/WEB-INF/view/mykmong/mykmong_body.jsp";
	}

}
