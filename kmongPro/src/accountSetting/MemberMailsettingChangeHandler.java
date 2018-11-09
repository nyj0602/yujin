package accountSetting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;
import com.util.JdbcUtil;

import command.CommandHandler;

public class MemberMailsettingChangeHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String sessionID = (String) request.getSession().getAttribute("authUser");
		String profileEmail = request.getParameter("profileEmail");
		String profileSms = request.getParameter("profileSms");
		String messageEmail = request.getParameter("messageEmail");
		String orderStatusEmail = request.getParameter("orderStatusEmail");
		String orderMessageEmail =request.getParameter("orderMessageEmail");
		String gigEmail = request.getParameter("gigEmail");
		String gigSms =request.getParameter("gigSms");
		String newsletterEmail =request.getParameter("newsletterEmail");
		System.out.println(profileEmail);
		System.out.println(sessionID);
		Connection conn = null;
		try {
			if (profileEmail != null) {
				if (profileEmail.equals("1")) {
					String sql = "update not_setting set ns_email=1 where m_email= ? and ns_seq=1";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				} else {
					System.out.println("0일때");
					String sql = "update not_setting set ns_email=0 where m_email= ? and ns_seq=1";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				}

			} else if (profileSms != null) {
				if (profileSms.equals("1")) {
					String sql = "update not_setting set ns_sns=1 where m_email= ? and ns_seq=1";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				} else {
					System.out.println("0일때");
					String sql = "update not_setting set ns_sns=0 where m_email= ? and ns_seq=1";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				}

			} else if (messageEmail != null) {
				if (messageEmail.equals("1")) {
					String sql = "update not_setting set ns_email=1 where m_email= ? and ns_seq=2";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				} else {
					System.out.println("0일때");
					String sql = "update not_setting set ns_email=0 where m_email= ? and ns_seq=2";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				}
			} else if (orderStatusEmail != null) {
				if (orderStatusEmail.equals("1")) {
					String sql = "update not_setting set ns_email=1 where m_email= ? and ns_seq=3";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				} else {
					System.out.println("0일때");
					String sql = "update not_setting set ns_email=0 where m_email= ? and ns_seq=3";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				}
			} else if(orderMessageEmail!= null){
				if (orderMessageEmail.equals("1")) {
					String sql = "update not_setting set ns_email=1 where m_email= ? and ns_seq=4";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				} else {
					System.out.println("0일때");
					String sql = "update not_setting set ns_email=0 where m_email= ? and ns_seq=4";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				}
			}else if(gigEmail!= null) {
				if (gigEmail.equals("1")) {
					String sql = "update not_setting set ns_email=1 where m_email= ? and ns_seq=5";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				} else {
					System.out.println("0일때");
					String sql = "update not_setting set ns_email=0 where m_email= ? and ns_seq=5";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				}
			}else if(gigSms!= null) {
				if (gigSms.equals("1")) {
					String sql = "update not_setting set ns_sns=1 where m_email= ? and ns_seq=5";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				} else {
					System.out.println("0일때");
					String sql = "update not_setting set ns_sns=0 where m_email= ? and ns_seq=5";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				}
			}else if(newsletterEmail!= null) {
				if (newsletterEmail.equals("1")) {
					String sql = "update not_setting set ns_email=1 where m_email= ? and ns_seq=6";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				} else {
					System.out.println("0일때");
					String sql = "update not_setting set ns_email=0 where m_email= ? and ns_seq=6";
					conn = ConnectionProvider.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					int SorF = pstmt.executeUpdate();
					String Success = null;

					if (SorF == 0) { // 실패
						Success = "변경실패";
					} else { // 성공
						Success = "변경성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/member/member_Edit.jsp";
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		

		return "/WEB-INF/view/member/member_Edit.jsp";
	}

}
