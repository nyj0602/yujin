package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;
import com.util.JdbcUtil;

import AES128.AES128Cipher;
import command.CommandHandler;
import dto.MemberDAO;
import service.LoginFailException;

public class LoginCheckHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String message = request.getParameter("messageGo");
		System.out.println("message는이거다:" + message);

		if (request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("여기까지넘어옴1");
			return progressForm(request, response);
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			System.out.println("여기까지넘어옴2");
			return processSubmit(request, response);
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}

	}

	private String progressForm(HttpServletRequest request, HttpServletResponse response) {
		String message = request.getParameter("messageGo");
		// TODO Auto-generated method stub

		System.out.println("여기까지넘어옴3");
		if (message == "messageGo") {
			return "/WEB-INF/view/message/message.jsp";
		} else {
			return "/WEB-INF/view/login/loginsub.jsp";
		}
	}

	private String processSubmit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = request.getParameter("messageGo");
		System.out.println("여기까지넘어옴4");
		System.out.println(message);

		Connection conn = null;

		try {
			if (message == "messageGo") {
				conn = ConnectionProvider.getConnection();
				String m_email = request.getParameter("m_email");
				String m_pwd = request.getParameter("m_pwd");
				System.out.println("message핸들러");

				String sql = "select M_WDRAING from member where m_email = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_email);
				ResultSet rs = pstmt.executeQuery();
				String withdrawal = null;

				while (rs.next()) {
					withdrawal = rs.getString(1);
				}
				if (withdrawal == null) {
					withdrawal = "2";
				}
				String errors = null;
				if (withdrawal.equals("0")) {
					errors = null;
					if (m_email == null || m_email.isEmpty()) {
						errors = "notInput_email";
						request.setAttribute("errors", errors);
						return "/WEB-INF/view/login/loginsub.jsp";
					} else if (m_pwd == null || m_pwd.isEmpty()) {
						errors = "notInput_pass";
						request.setAttribute("errors", errors);
						return "/WEB-INF/view/login/loginsub.jsp";
					}

					MemberDAO dao = new MemberDAO();

					AES128Cipher aes = new AES128Cipher();
					m_pwd = aes.encAES(m_pwd);

					String email = (String) dao.searchEmail(conn, m_email);
					String pwd = (String) dao.searchPwd(conn, m_email, m_pwd);
					System.out.println("핸들러" + email);
					System.out.println("핸들러" + m_email);
					System.out.println(pwd);
					if (email == null) {
						errors = "missmatch_email";
						request.setAttribute("errors", errors);
						return "/WEB-INF/view/login/loginsub.jsp";
					} else { //
						System.out.println(pwd);
						if (pwd == null) {
							errors = "missmatch_pwd";
							request.setAttribute("errors", errors);
							return "/WEB-INF/view/login/loginsub.jsp";
						} else {
							errors = "not_errors";
							request.setAttribute("errors", errors);
							request.getSession().setAttribute("authUser", email);
							return "/WEB-INF/view/message/message.jsp";
						}
					}
				} else if (withdrawal.equals("1")) {
					errors = "withdrawalMember";
					request.setAttribute("errors", errors);
					return "/WEB-INF/view/login/loginsub.jsp";
				} else if (withdrawal.equals("2")) {
					errors = "missmatch_email";
					request.setAttribute("errors", errors);
					return "/WEB-INF/view/login/loginsub.jsp";
				}

			} else {
				// System.out.println("XXXX");
				System.out.println("여기까지넘어옴5");
				conn = ConnectionProvider.getConnection();
				String m_email = request.getParameter("m_email");
				String m_pwd = request.getParameter("m_pwd");

				String sql = "select M_WDRAING from member where m_email = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_email);
				ResultSet rs = pstmt.executeQuery();
				String withdrawal = null;

				System.out.println("여기까지넘어옴6");
				while (rs.next()) {
					withdrawal = rs.getString(1);
				}
				if (withdrawal == null) {
					withdrawal = "2";
				}

				String errors = null;
				System.out.println(withdrawal);

				System.out.println("여기까지넘어옴7");
				if (withdrawal.equals("0")) {
					System.out.println("여기까지넘어옴9");

					if (m_email == null || m_email.isEmpty()) {
						errors = "notInput_email";
						request.setAttribute("errors", errors);
						return "/WEB-INF/view/login/loginsub.jsp";
					} else if (m_pwd == null || m_pwd.isEmpty()) {
						errors = "notInput_pass";
						request.setAttribute("errors", errors);
						return "/WEB-INF/view/login/loginsub.jsp";
					}

					MemberDAO dao = new MemberDAO();

					AES128Cipher aes = new AES128Cipher();
					m_pwd = aes.encAES(m_pwd);

					String email = (String) dao.searchEmail(conn, m_email);
					String pwd = (String) dao.searchPwd(conn, m_email, m_pwd);
					System.out.println("핸들러" + email);
					System.out.println("핸들러" + m_email);
					System.out.println(pwd);
					if (email == null) {
						errors = "missmatch_email";
						request.setAttribute("errors", errors);
						return "/WEB-INF/view/login/loginsub.jsp";
					} else { //
						System.out.println(pwd);
						if (pwd == null) {
							errors = "missmatch_pwd";
							request.setAttribute("errors", errors);
							return "/WEB-INF/view/login/loginsub.jsp";
						} else {
							errors = "not_errors";
							request.setAttribute("errors", errors);
							request.getSession().setAttribute("authUser", email);
							return "/WEB-INF/view/login/loginsub.jsp";
						}
					}
				} else if (withdrawal.equals("1")) {

					System.out.println("여기까지넘어옴8");
					errors = "withdrawalMember";
					request.setAttribute("errors", errors);
					return "/WEB-INF/view/login/loginsub.jsp";

				} else if (withdrawal.equals("2")) {
					errors = "missmatch_email";
					request.setAttribute("errors", errors);
					return "/WEB-INF/view/login/loginsub.jsp";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}

		return "/WEB-INF/view/login/loginsub.jsp";

	}

}
