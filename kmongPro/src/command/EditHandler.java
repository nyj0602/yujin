package command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import net.sf.json.JSONArray;

public class EditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Connection conn = null;
		conn=DBConn.getConnection();
		
		PreparedStatement pstmt = null;
		JSONArray result = new JSONArray();
		String query ;
		
		String state = request.getParameter("state") ==null ? "" : request.getParameter("state");
		
		
		if(state.contains("stop")) {
			String tseq = request.getParameter("t_seq");
			int t_seq = Integer.parseInt(tseq);
			
			query = "update tal_state set ts_name = '판매중지' where t_seq = ?";
			
			try {
				conn.setAutoCommit(false);
				pstmt=conn.prepareStatement(query);
				
				pstmt.setInt(1, t_seq);
				
				result.add(pstmt.executeUpdate());  
				
				conn.commit();
				} catch(SQLException e) {
					conn.rollback();
					
				}
				
				request.setAttribute("data", result);
			
			
		}else {
		
		
		String tseq = request.getParameter("t_seq");
		int t_seq = Integer.parseInt(tseq);
		

		query = "update tal_state set ts_name = '삭제' where t_seq = ?";
		
		try {
		conn.setAutoCommit(false);
		pstmt=conn.prepareStatement(query);
		
		pstmt.setInt(1, t_seq);
		
		result.add(pstmt.executeUpdate());  
		
		conn.commit();
		} catch(SQLException e) {
			conn.rollback();
			
		}
		
		request.setAttribute("data", result);
		
		}


		
		return "/WEB-INF/view/sell/vacation.jsp";
	}
}
