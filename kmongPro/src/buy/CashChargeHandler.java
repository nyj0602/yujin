package buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;

public class CashChargeHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn=DBConn.getConnection();
		String id = "dodo95123@naver.com"; // 세션 받아와서 저장
		String name = "soomin1";
		
		String query = "select s.sc_money, c.cc_money from save_cash s join charge_cash c on s.m_email=c.m_email where s.m_email=? and c.m_email=?"; 
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		pstmt.setString(2, id);
				
		rs = pstmt.executeQuery();
		
		
		int sc=0, cc=0;
		while(rs.next()) {
			
			sc = rs.getInt(1);
			cc = rs.getInt(2);
		}
		
		request.setAttribute("sc", sc);
		request.setAttribute("cc", cc);
		
		
		return "/WEB-INF/view/buy/charge_body.jsp";
	}

}
