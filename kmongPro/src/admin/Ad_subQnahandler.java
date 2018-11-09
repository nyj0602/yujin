package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONArray;

public class Ad_subQnahandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Ad_subQnahandler**");

		String o_seqs = request.getParameter("o_seq");
		// 로그인 된 관리자 가져오기
		String id = "admin02";
		
		int o_seq = Integer.parseInt(o_seqs);
		
		System.out.println("> "+o_seq);

		Connection conn = null;
		conn=DBConn.getConnection();
		PreparedStatement pstmt = null;
		
		JSONArray result = new JSONArray();
		
		String query = "update ONE_QA set a_id=? where one_seq = ?";
		
		try {
			conn.getAutoCommit();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, o_seq);
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
