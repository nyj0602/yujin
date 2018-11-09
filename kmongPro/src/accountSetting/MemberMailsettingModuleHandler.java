package accountSetting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;
import com.util.JdbcUtil;

import command.CommandHandler;
import dto.NotSettingDTO;

public class MemberMailsettingModuleHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sessionID = request.getParameter("sessionID");

		String sql = "select m_sep from member where m_email = ?";

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			if (sessionID == null) {
				return "/WEB-INF/view/login/login.jsp";
			}

			conn = ConnectionProvider.getConnection();
			 pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sessionID);

			 rs = pstmt.executeQuery();
			String division = null;

			while (rs.next()) {
				division = rs.getString(1);
			}

			String result = null;
			if (division.equals("개인회원") || division.equals("기업회원")) {
				result = "일반회원";
			} else {
				result = "판매자";
			}
			result = "판매자";
			request.setAttribute("result", result);

			// 계정정보변경
			sql = "select ns_seq, m_email, ns_email, ns_sns from not_setting where m_email = ? and ns_seq=1";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sessionID);

			rs = pstmt.executeQuery();

			String one_ns_email = null;
			String one_ns_sns = null;

			while (rs.next()) {
				one_ns_email = rs.getString(3);
				one_ns_sns = rs.getString(4);
			}

			request.setAttribute("one_ns_email", one_ns_email);
			request.setAttribute("one_ns_sns", one_ns_sns);

			// 문의메세지
			sql = "select ns_seq, m_email, ns_email, ns_sns from not_setting where m_email = ? and ns_seq=2";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sessionID);

			rs = pstmt.executeQuery();

			String two_ns_email = null;
			String two_ns_sns = null;

			while (rs.next()) {
				two_ns_email = rs.getString(3);
				two_ns_sns = rs.getString(4);
			}

			request.setAttribute("two_ns_email", two_ns_email);
			request.setAttribute("two_ns_sns", two_ns_sns);

			// 거래메세지
			sql = "select ns_seq, m_email, ns_email, ns_sns from not_setting where m_email = ? and ns_seq=3";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sessionID);

			rs = pstmt.executeQuery();

			String three_ns_email = null;
			String three_ns_sns = null;

			while (rs.next()) {
				three_ns_email = rs.getString(3);
				three_ns_sns = rs.getString(4);
			}

			request.setAttribute("three_ns_email", three_ns_email);
			request.setAttribute("three_ns_sns", three_ns_sns);

			// 거래메세지
			sql = "select ns_seq, m_email, ns_email, ns_sns from not_setting where m_email = ? and ns_seq=4";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sessionID);

			rs = pstmt.executeQuery();

			String four_ns_email = null;
			String four_ns_sns = null;

			while (rs.next()) {
				four_ns_email = rs.getString(3);
				four_ns_sns = rs.getString(4);
			}

			request.setAttribute("four_ns_email", four_ns_email);
			request.setAttribute("four_ns_sns", four_ns_sns);

			// 나의서비스관련
			sql = "select ns_seq, m_email, ns_email, ns_sns from not_setting where m_email = ? and ns_seq=5";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sessionID);

			rs = pstmt.executeQuery();

			String five_ns_email = null;
			String five_ns_sns = null;

			while (rs.next()) {
				five_ns_email = rs.getString(3);
				five_ns_sns = rs.getString(4);
			}

			request.setAttribute("five_ns_email", five_ns_email);
			request.setAttribute("five_ns_sns", five_ns_sns);

			// 뉴스레터
			sql = "select ns_seq, m_email, ns_email, ns_sns from not_setting where m_email = ? and ns_seq=6";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sessionID);

			rs = pstmt.executeQuery();

			String six_ns_email = null;
			String six_ns_sns = null;

			while (rs.next()) {
				six_ns_email = rs.getString(3);
				six_ns_sns = rs.getString(4);
			}

			request.setAttribute("six_ns_email", six_ns_email);
			request.setAttribute("six_ns_sns", six_ns_sns);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}

		return "/WEB-INF/view/member/member_setting.jsp";
	}

}
