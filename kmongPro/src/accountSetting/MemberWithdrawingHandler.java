package accountSetting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;
import com.util.JdbcUtil;

import command.CommandHandler;

public class MemberWithdrawingHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");// 회원탈퇴입력한아이디
		String sessionID = (String) request.getSession().getAttribute("authUser"); // 로그인된아이디
		System.out.println(email);
		System.out.println(sessionID);
		
		Connection conn = null;
		
		try {
			String sql = "select m_email from member where m_email = ?";
			conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();

			int SorF;
			String searchEmail = null;

			while (rs.next()) {
				searchEmail = rs.getString(1);
			}
			System.out.println(searchEmail);
			String Success = null;
			
			if (searchEmail == null || !email.equals(sessionID) ) {
				Success = "가입하신이메일과동일X";
			} else {
				sql = "update member set m_wdraing=1 where m_email= ?";
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, email);
				SorF = pstmt.executeUpdate();

				if (SorF == 0) {
					Success = "실패";
				} else {
					Success = "성공";
				}

			}
			request.setAttribute("Success", Success);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}

		

		return "/WEB-INF/view/member/member_Edit.jsp";
	}

}
