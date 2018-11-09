package management;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;

public class RatingHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");
		PreparedStatement  pstmt = null;
		String ordernum = request.getParameter("orderNum");
		System.out.println(ordernum);
		
		String sql = "";
		try {
			
			sql = " insert into process_list values(PROLIST_SEQ.NEXTVAL,'kmong','평가 미작성','',sysdate ,1 ,? )";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			pstmt.executeUpdate();
			
			sql = " insert into completed values(?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
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
		request.setAttribute("complete", "complete");
		return "/WEB-INF/view/management/deliverycheck.jsp";
	}

}
