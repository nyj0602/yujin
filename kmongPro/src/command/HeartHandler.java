package command;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import net.sf.json.JSONObject;
import service.HeartService;

public class HeartHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//System.out.println(">>>> heartHandler ~~~");
		int t_seq = Integer.parseInt(request.getParameter("PID"));
		//System.out.println("재능번호"+t_seq);
		Connection conn = ConnectionProvider.getConnection();
		
		
		String m_email = (String) request.getSession().getAttribute("authUser");
		
		
		HeartService heartService = new HeartService();
		int re = heartService.insertHeart(conn,m_email,t_seq);
		JSONObject data = new JSONObject();
		//System.out.println("insert실패시?"+re);
		if(re!=1) {
			heartService.deleteHeart(conn, m_email,t_seq);
			re=0;
		}
		data.put("re", re);
		request.setAttribute("data", data);
		
		return "/WEB-INF/view/main/heartcheck.jsp";
	}

}
