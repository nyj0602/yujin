package refund;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;

public class CashreturnHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String returnbank = request.getParameter("returnbank");
		String account_owner = request.getParameter("account_owner");
		String survey_answer = request.getParameter("survey_answer");
		String account_number = request.getParameter("account_number");
		String returncash = request.getParameter("returncash");
		
		/*Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");*/
		//conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SCOTT", "TIGER");
		
		Connection conn = DBConn.getConnection();
		String sql = "insert into cash_refund values (cash_refund_seq, ?, ?, sysdate, 0, ?, 'dodo95123@naver.com', '캐시' )";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		int result = 0;
		
		try {
			pstmt.setString(1, account_number.toString());
			pstmt.setString(2, account_owner.toString());
			pstmt.setInt(3, Integer.parseInt(returnbank));
			result = pstmt.executeUpdate();

		}catch (SQLException e) { 
			e.printStackTrace();
		} finally{
			try {
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		
		
		String sql_list = "insert into cash_list (cl_seq, cl_state, cl_price, cl_date, m_email, cl_sep) values ( cash_refund_cl_seq.nextVal, '크몽캐시 환불', ?, sysdate, 'dodo95123@naver.com', '환불')";
		PreparedStatement pstmt_list = conn.prepareStatement(sql_list);
		int result_list = 0;
		
		try {
			pstmt_list.setInt(1, Integer.parseInt(returncash));
			result_list = pstmt_list.executeUpdate();

		}catch (SQLException e) { 
			e.printStackTrace();
		} finally{
			try {
				pstmt_list.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		
		
		return "/WEB-INF/view/refund/cashreturnEnd.jsp";
	}

}
