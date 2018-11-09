package command;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import net.sf.json.JSONArray;
import service.WorkService;

public class WorkCheckHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("workHandler");
		Connection conn = ConnectionProvider.getConnection();
		
		
		String m_email = (String) request.getSession().getAttribute("authUser");
		
		WorkService workService = new WorkService();
		JSONArray data = workService.selectWork(conn,m_email);
		request.setAttribute("data", data);
		
		
		
		return "/WEB-INF/view/my_kmong/workcheck.jsp";
	}

}
