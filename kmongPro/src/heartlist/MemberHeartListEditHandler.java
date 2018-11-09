package heartlist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;
import com.util.JdbcUtil;

import command.CommandHandler;

public class MemberHeartListEditHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sql = "delete from heart where m_email = ? and t_seq = ?";
		String sessionID = (String) request.getSession().getAttribute("authUser");
		String choiceTalent = request.getParameter("choiceTalent");
		String t_seq = request.getParameter("t_seq");

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = ConnectionProvider.getConnection();
			 pstmt = conn.prepareStatement(sql);

			String m_email = request.getParameter("m_email");

			String Success = null;

			pstmt.setString(1, sessionID);
			pstmt.setString(2, choiceTalent);
			/* try { */

			int SorF = pstmt.executeUpdate();

			if (SorF == 0) { // 실패
				sql = "insert into heart values(?,?)";
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, sessionID);
				pstmt.setString(2, t_seq);
				pstmt.executeUpdate();

				Success = "찜목록재등록";
				request.setAttribute("Success", Success);
				return "/WEB-INF/view/member/member_Edit.jsp";
			} else { // 성공
				Success = "성공";
				request.setAttribute("Success", Success);
				return "/WEB-INF/view/member/member_Edit.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pstmt.close();
			conn.close();
		}

		return null;

	}

}
