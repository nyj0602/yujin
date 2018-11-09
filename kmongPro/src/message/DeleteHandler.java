package message;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class DeleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager .getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");
		PreparedStatement  pstmt = null;
		String sql = "";
		String [] deletelist = request.getParameterValues("delete");
		String delete = "";
		try {
			for (int i = 0; i < deletelist.length; i++) {
				String [] deletes = deletelist[i].split("_");
				int separate = Integer.parseInt(deletes[0]);
				String mr_seq = deletes[1];
				System.out.println(separate);
				if (separate==1) {
					sql = "UPDATE msg_relation 	SET del_t=0	WHERE mr_seq=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, mr_seq);
					pstmt.executeUpdate();	
				}else {
					sql = "UPDATE msg_relation 	SET del_b=0	WHERE mr_seq=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, mr_seq);
					pstmt.executeUpdate();	
				}
				
			}
			
		} catch (SQLException e) {
			System.out.println(e.toString());
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			 //if (conn != null) try { conn.close();} catch (Exception e) { }
		}
		request.setAttribute("complete", "complete");
		return "/WEB-INF/view/message/deleteCheck.jsp";
	}

}
