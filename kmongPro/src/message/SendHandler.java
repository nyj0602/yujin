package message;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;

public class SendHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager .getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");
		PreparedStatement  pstmt = null;
		String sql = "";
		String sender = request.getParameter("sender");
		String seq = request.getParameter("sequence");
		String content = request.getParameter("content");
		// (1) Calendar객체를 얻는다.
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat date = new SimpleDateFormat("yy.MM.dd hh:mm");
		String datetime = date.format(cal.getTime());

		System.out.println(datetime);
		System.out.println(sender);
		System.out.println(seq);
		System.out.println(content);
		try {
			sql = " insert into message values(MSG_SEQ.NEXTVAL,?,sysdate,0,?,?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setString(2, sender);
			pstmt.setString(3, seq);
			pstmt.executeUpdate();	
			
			
			
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
		
		request.setAttribute("datetime", datetime);
		request.setAttribute("complete", "complete");
		request.setAttribute("seq", seq);
		request.setAttribute("content", content);
		return "/WEB-INF/view/message/sendCheck.jsp";
	}

}
