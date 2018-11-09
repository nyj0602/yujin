package message;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import command.CommandHandler;

public class GiveStarHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager .getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");
		PreparedStatement  pstmt = null;
		String sql = "";
		String star = request.getParameter("value");
		String [] stars = star.split("_");
		int mr_star = Integer.parseInt( stars[0] );
		String mr_seq = stars[1];
		int separate = Integer.parseInt( stars[2] ) ;
		
		System.out.println(star);
		try {
			if (separate==1) {
				if (mr_star==0) {
					sql = "UPDATE msg_relation 	SET mr_star=10	WHERE mr_seq = ?";
				}else {
					sql = "UPDATE msg_relation 	SET mr_star=11	WHERE mr_seq = ?";
				}
			} else {
				if (mr_star==0) {
					sql = "UPDATE msg_relation 	SET mr_star=1	WHERE mr_seq = ?";
				}else {
					sql = "UPDATE msg_relation 	SET mr_star=11	WHERE mr_seq = ?";
				}
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mr_seq);
			pstmt.executeUpdate();	
			
			pstmt = conn.prepareStatement(sql);
			
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
		request.setAttribute("star", "star");
		return "/WEB-INF/view/message/starCheck.jsp";
	}//process

}//StarHandler
