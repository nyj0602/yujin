package accountSetting;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;

public class MemberSmsMailSettingHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		String sessionID = (String) request.getSession().getAttribute("authUser");
		if(sessionID==null) {
			return "/WEB-INF/view/login/login.jsp";
		}		
		request.setAttribute("sessionID", sessionID);
		
		return "/WEB-INF/view/member/memberAlertSetting.jsp";
	}
	
}
