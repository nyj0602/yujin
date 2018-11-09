package heartlist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;
import com.util.JdbcUtil;

import command.CommandHandler;

public class MemberHeartListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		String sessionID = (String) request.getSession().getAttribute("authUser");
		System.out.println("세션아이디" + sessionID);
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {
			if (sessionID == null) {
				return "/WEB-INF/view/login/login.jsp";
			} else {
				String sql = "select m_email,t_Seq from heart where m_email=?";
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, sessionID);
				rs = pstmt.executeQuery();

				String m_email = null;
				String t_seq = null;
				while (rs.next()) {
					m_email = rs.getString(1);
					t_seq = rs.getString(1);
				}

				request.setAttribute("m_email", m_email);
				request.setAttribute("t_seq", t_seq);

				request.setAttribute("sessionID", sessionID);
			}
			return "/WEB-INF/view/member/memberBookMark.jsp";

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		return null;

	}

}
