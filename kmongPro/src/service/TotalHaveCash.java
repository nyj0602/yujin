package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TotalHaveCash {


	public int calTotalHaveCash(Connection conn, String m_email) throws SQLException {
		int total_cash=0;
		
		String sql="select addCash-spendCash haveCash\r\n" + 
				"from\r\n" + 
				"(select m_email, sum(cl_price) addCash\r\n" + 
				"from cash_list\r\n" + 
				"where m_email=? and (cl_sep='적립' or cl_sep='충전')\r\n" + 
				"group by m_email) a\r\n" + 
				"join\r\n" + 
				"(select m_email, sum(cl_price) spendCash\r\n" + 
				"from cash_list\r\n" + 
				"where cl_sep='사용' and m_email=?\r\n" + 
				"group by m_email) s\r\n" + 
				"on a.m_email=s.m_email ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		pstmt.setString(2, m_email);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			total_cash = rs.getInt("haveCash");
		}
		
		return total_cash;
	}
}
