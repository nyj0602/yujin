package command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.util.DBConn;

import net.sf.json.JSONArray;

public class ReportSetHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("reportsethandler");
		String adminid = "admin01";
		
		String id = "dodo95123@naver.com";
		
		String nick = request.getParameter("nick");
		String content = request.getParameter("content");
		
		// 파일 업로드 읽어오기 불가능. 
		String files = request.getParameter("files")==null ? null : request.getParameter("files");		

		
		Connection conn = null;
		conn=DBConn.getConnection();
		PreparedStatement pstmt = null;
		JSONArray result = new JSONArray();		

		String query ="insert into report (r_seq, r_email, r_nick, r_con, r_evide, a_id) values (report_seq.nextval, ?, ?, ?, ?, ?)";
		
		try {
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.setString(2, nick);
			pstmt.setString(3, content);
			pstmt.setString(4, files);
			pstmt.setString(5, adminid);

			result.add(pstmt.executeUpdate());  
			
			conn.commit();
			} catch(SQLException e) {
				e.printStackTrace();
				conn.rollback();
			}
		
		
		request.setAttribute("data", result);
	
		return "/WEB-INF/view/sell/vacation.jsp";

	} 

}
