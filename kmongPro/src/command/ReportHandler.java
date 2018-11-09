package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReportHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = "dodo95123@naver.com";
		String name = "soomin1";
		
		request.setAttribute("name", name);
		
		
		return "/WEB-INF/view/mykmong/report_body.jsp";

	}

}
