package command;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import net.sf.json.JSONArray;
import service.MessageInfoService;

public class AlarmHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

	   //System.out.println(">>>> AlarmHandler ~~~"); 
		
		Connection conn = ConnectionProvider.getConnection();
		
		
		String m_email = (String) request.getSession().getAttribute("authUser");
		MessageInfoService messageInfoService = new MessageInfoService();
		JSONArray data = messageInfoService.messageInfoService(conn, m_email);
		request.setAttribute("data", data);

		int alamcount = data.size();
		
		return "/WEB-INF/view/inc/header/alarmcheck.jsp";
	}
	
}
