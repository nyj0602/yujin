package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONArray;

public class Ad_deltalHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("Ad_deltalHandler**");

		String t_seq = request.getParameter("t_seq");

		System.out.println("> "+t_seq);

		Connection conn = null;
		conn=DBConn.getConnection();
		PreparedStatement pstmt = null;
		
		JSONArray result = new JSONArray();
		
		String query = "update tal_state set ts_name='서비스삭제' where t_seq = ?";
		
		try {
			conn.getAutoCommit();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, t_seq);
			result.add(pstmt.executeUpdate());
			
			conn.commit();
		} catch (Exception ex) {
			conn.rollback();
			System.out.println(ex.toString());
			
		}
		
		request.setAttribute("data", result);
		
		
		return "/WEB-INF/view/sell/vacation.jsp";
		
	}

}
