package accountSetting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;
import com.util.JdbcUtil;

import command.CommandHandler;

public class MemberMyInfomationHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String sessionID = (String) request.getSession().getAttribute("authUser");
		System.out.println(sessionID);

		Connection conn = null;

		try {
			if (sessionID == null) {
				System.out.println("if접근");
				return "/WEB-INF/view/login/login.jsp";
			} else {
				System.out.println("else접근");
				String sql = "select m_email, m_name, m_sep from member where m_email = ?";
				conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, sessionID);

				ResultSet rs = pstmt.executeQuery();

				String m_email = null;
				String m_name = null;
				String m_sep = null;
				String m_phonenum = null;
				String StartTime = null;
				String EndTime = null;
				String nick_change = null;

				while (rs.next()) {
					m_email = rs.getString(1);
					m_name = rs.getString(2);
					m_sep = rs.getString(3);
				}
				request.setAttribute("m_email", m_email);
				request.setAttribute("m_name", m_name);

				m_sep = m_sep.substring(0, 2);
				System.out.println(m_sep);
				if (m_sep.equals("기업")) {
					sql = "select cm_phone, cm_call_1, cm_call_2,cm_nchange from com_member where m_email = ?";
					conn = ConnectionProvider.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					rs = pstmt.executeQuery();

					while (rs.next()) {
						m_phonenum = rs.getString(1);
						StartTime = rs.getString(2);
						EndTime = rs.getString(3);
						nick_change = rs.getString(4);
					}
					if (StartTime == null || EndTime == null) {
						StartTime = "0";
						EndTime = "0";
					}

					request.setAttribute("m_phonenum", m_phonenum);
					request.setAttribute("StartTime", StartTime);
					request.setAttribute("EndTime", EndTime);
					request.setAttribute("nick_change", nick_change);

				} else {
					sql = "select pm_phone, pm_call_1, pm_call_2,pm_nchange from per_member where m_email = ?";
					conn = ConnectionProvider.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					rs = pstmt.executeQuery();

					while (rs.next()) {
						m_phonenum = rs.getString(1);
						StartTime = rs.getString(2);
						EndTime = rs.getString(3);
						nick_change = rs.getString(4);
					}

					request.setAttribute("m_phonenum", m_phonenum);
					request.setAttribute("StartTime", StartTime);
					request.setAttribute("EndTime", EndTime);
					request.setAttribute("nick_change", nick_change);

				}

				// 프로필완성도
				sql = "select profile_cnt(?) from dual";
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, sessionID);
				rs = pstmt.executeQuery();

				int profileCNT = 0;

				while (rs.next()) {
					profileCNT = rs.getInt(1);
				}

				request.setAttribute("profileCNTs", profileCNT);
				request.setAttribute("sessionID", sessionID);
				profileCNT = 100 - profileCNT;
				System.out.println(profileCNT);
				request.setAttribute("profileCNT", profileCNT);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		return "/WEB-INF/view/member/memberMyInfomation.jsp";

		

	}

}
