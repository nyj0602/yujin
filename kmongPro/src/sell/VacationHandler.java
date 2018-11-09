package sell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONArray;

public class VacationHandler implements CommandHandler	{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("vacation1");

		String reason = request.getParameter("vacation_reason");
		String terms = request.getParameter("vacation_period");
		int term = terms==null? 0 : Integer.parseInt(terms);
		
		Connection conn = null;
		conn=DBConn.getConnection();
		
		PreparedStatement pstmt = null;
		
		String id = "nyj0602@naver.com";
		String query;
		JSONArray result = new JSONArray();
		
		// 휴가신청
		if (reason != null && terms != null ) {
			
		query = "insert into vacation (v_seq, v_start, v_end, m_email, v_reason) values ( vacation_seq.nextval, sysdate, sysdate+?, ?, ? )";
		
		try {
		
		pstmt=conn.prepareStatement(query);
		
		conn.setAutoCommit(false);
		
		pstmt.setInt(1, term);
		pstmt.setString(2, id);
		pstmt.setString(3, reason);
		
		result.add(pstmt.executeUpdate());  
		
		query = "update vac_state set v_state = '휴가' where m_email=?";
		
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		
		result.add(pstmt.executeUpdate());
		
		conn.commit();
		}catch (SQLException e) {
			e.printStackTrace();
			conn.rollback();
		}
		
				
		System.out.println(result);
		
		request.setAttribute("data", result);
		
		}
		
		// 복귀
		else {
			
			query = "update vac_state set v_state = '비휴가' where m_email=?";
			
			try {
				
			
			pstmt=conn.prepareStatement(query);
			
			conn.setAutoCommit(false);
			
			pstmt.setString(1, id);
			result.add(pstmt.executeUpdate());
			
			conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
				conn.rollback();
			}
			
			
			request.setAttribute("data", result);
			System.out.println(result+"***");

		}
			
		
		return "/WEB-INF/view/sell/vacation.jsp";
	}
	
	
	
	
}
