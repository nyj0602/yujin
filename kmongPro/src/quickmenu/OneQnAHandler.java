package quickmenu;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import com.util.ConnectionProvider;

import command.CommandHandler;

public class OneQnAHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String mailsender = request.getParameter("mailsender");
		String mailTitle = request.getParameter("mailTitle");
		String mailText = request.getParameter("mailText");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into one_qa (one_seq, one_email, one_sub,one_con,one_date,a_id) values(one_qaSEQ.nextval,?,?,?,to_date(sysdate,'YYYY-MM-DD hh24-mi-ss'),'admin01')";
			 conn = ConnectionProvider.getConnection();
			 pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mailsender);
			pstmt.setString(2, mailTitle);
			pstmt.setString(3, mailText);
			
			int SorF = pstmt.executeUpdate();
			String Success = null;
			
			if (SorF == 0) { // 실패
				Success = "실패";
			} else { // 성공
				Success = "성공";
			}
			request.setAttribute("Success", Success);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pstmt.close();
			conn.close();
		}
		
	
		
		return "/WEB-INF/view/inc/QuickMenu/OneQna.jsp";
	}
	
}
