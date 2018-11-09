package message;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class RelationHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager .getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");
		PreparedStatement  pstmt = null;
		ResultSet rs = null;
		int mr_seq=Integer.parseInt( request.getParameter("mr_seq") );
		String t_seq = request.getParameter("t_seq");
		String sessionID =(String)request.getSession().getAttribute("authUser");  //세션에 저장된값 가져오기
		if (sessionID==null) {
			return "/WEB-INF/view/login/login.jsp";
		}
		String sql = "";
		JSONObject seq = new JSONObject();
		//해당 구매자와 판매자에 관한 mr_seq가 없을경우 만들어서 msg_relation테이블에 추가하고 그에 해당하는 시퀀스값 가져와서 밑에 다른 쿼리들 수행
		try {
		if (mr_seq==0) {
			sql = " insert into msg_relation values(mr_seq.nextval,?,?,0,1,1) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_seq);
			pstmt.setString(2, sessionID);
			pstmt.executeUpdate();

			sql= " select mr_seq from msg_relation mr join talent t on mr.t_seq=t.t_seq ";
			sql += " where t.t_seq=? and buy_email like '"+sessionID+"'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_seq);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				seq.put("mr_seq", rs.getInt(1));
			}
			mr_seq= (int) seq.get("mr_seq");
			System.out.println("mrseq :" + mr_seq);
		}
		} catch (SQLException e) {
			System.out.println(e.toString());
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			// if (conn != null) try { conn.close();} catch (Exception e) { }

		}
		
		System.out.println(mr_seq);
		request.setAttribute("email", sessionID);
		request.getSession().setAttribute("sessionMr_seq", mr_seq); 
		request.setAttribute("mr_seq", mr_seq);
		request.setAttribute("t_seq", t_seq);
		return "/WEB-INF/view/message/realtion.jsp";
	}

}
