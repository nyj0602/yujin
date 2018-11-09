package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONArray;

public class Ad_subreporthandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("Ad_subreporthandler**");

		String r_seqs = request.getParameter("r_seq");
		// 로그인 된 관리자 가져오기
		String id = "admin02";
		
		int r_seq = Integer.parseInt(r_seqs);
		
		System.out.println("> "+r_seq);

		Connection conn = null;
		conn=DBConn.getConnection();
		PreparedStatement pstmt = null;
		
		JSONArray result = new JSONArray();
		
		String query = "update report set a_id=? where r_seq = ?";
		
		try {
			conn.getAutoCommit();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, r_seq);
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
