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

import AES128.AES128Cipher;
import command.CommandHandler;

public class MemberchangingPwdHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//
		String old_password = request.getParameter("old_password");
		String new_password = request.getParameter("new_password");
		String confirm_password = request.getParameter("confirm_password");
		String sessionID = (String) request.getSession().getAttribute("authUser"); // 로그인된아이디
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "select m_pwd from member where m_email = ?";
			 conn = ConnectionProvider.getConnection();
			 pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sessionID);
			 rs = pstmt.executeQuery();

			String joinPwd = null;
			String Success = null;

			while (rs.next()) {
				joinPwd = rs.getString(1);
			}

			// joinPwd복호화
			AES128Cipher aes = new AES128Cipher();
			joinPwd = aes.decAES(joinPwd);

			if (!joinPwd.equals(old_password)) {
				Success = "기존비밀번호일치X";
				request.setAttribute("Success", Success);
			} else {
				System.out.println(new_password);
				System.out.println(confirm_password);
				System.out.println(old_password);
				if (!new_password.equals(confirm_password)) {
					Success = "입력한패스워드동일X";
					request.setAttribute("Success", Success);
				} else if (new_password.equals(old_password) ){
					Success = "기존패스워드와동일";
					request.setAttribute("Success", Success);
				}else {
					if (new_password.length() < 6) {
						Success = "패스워드길이부족";
						request.setAttribute("Success", Success);
					} else {
						// new_password 암호화
						new_password = aes.encAES(new_password);
						sql = "update member set m_pwd= '" + new_password + "' where m_email = '" + sessionID + "'";
						System.out.println(sql);
						conn = ConnectionProvider.getConnection();
						Statement stmt = conn.createStatement();

						int SorF = stmt.executeUpdate(sql);
						if (SorF == 0) {
							Success = "실패";
							request.setAttribute("Success", Success);
						} else {
							Success = "성공";
							request.setAttribute("Success", Success);
						}

					}

				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			rs.close();
			pstmt.close();
			conn.close();
		}

		

		return "/WEB-INF/view/member/member_Edit.jsp";
	}

}
