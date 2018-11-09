package message;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.ConnectionProvider;
import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class MessageListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager .getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");
		PreparedStatement  pstmt = null;
		String sql = "";
		String email =(String)request.getSession().getAttribute("authUser");  //세션에 저장된값 가져오기
		if (email==null) {
			return "/WEB-INF/view/login/login.jsp";
		}
		JSONObject message = new JSONObject();
		JSONArray marr = new JSONArray();
		JSONObject msgobj = new JSONObject();
		ResultSet rs = null;
		try {

			sql = " select * from (select mr.mr_seq , t.t_seq, t.m_email , buy_email, m.m_profile buyerprofile, mr_star, msg_content, msg_seq, to_char(msg_send,'yy.mm.dd HH24:MI') sendtime, msg_ck ,msg_sender ,rank() over (partition by (m.mr_seq)order by msg_send desc) rank, me.m_profile sellprofile, del_t , del_b ";
			sql +=	" from msg_relation mr join message m on mr.mr_seq=m.mr_seq join talent t on t.t_seq=mr.t_seq join member m on m.m_email = mr.buy_email join member me on t.m_email = me.m_email ) ";
			sql +=	" where rank=1 order by sendtime desc ";
			

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				msgobj.put("mr_seq", rs.getInt(1));
				msgobj.put("t_seq", rs.getInt(2));
				msgobj.put("m_email", rs.getString(3));
				msgobj.put("buy_email", rs.getString(4));
				msgobj.put("buyerprofile", rs.getString(5));
				msgobj.put("mr_star", rs.getInt(6));
				msgobj.put("msg_content", rs.getString(7));
				msgobj.put("msg_seq", rs.getInt(8));
				msgobj.put("sendtime", rs.getString(9));
				msgobj.put("msg_ck", rs.getInt(10));
				msgobj.put("msg_sender", rs.getString(11));
				msgobj.put("rank", rs.getInt(12));
				msgobj.put("sellprofile", rs.getString(13));
				msgobj.put("del_t", rs.getInt(14));
				msgobj.put("del_b", rs.getInt(15));
				
				marr.add(msgobj);
				message.put("ms", marr);
			}//while
			
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
		
		request.setAttribute("message", message);
		request.setAttribute("email", email);
		return "/WEB-INF/view/message/messageList.jsp";
	}

}
