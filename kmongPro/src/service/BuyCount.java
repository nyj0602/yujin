package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BuyCount {

	public int selectCount(Connection conn, String m_email) throws SQLException {
		String sql = "select count(*) buycount\r\n" + 
				"from payment p\r\n" + 
				"join payment_done pd\r\n" + 
				"on p.p_seq=pd.p_seq\r\n" + 
				"where M_EMAIL=? and p_sep='서비스 구매' ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		
		rs=pstmt.executeQuery();
		
		rs.next();
		
		int buycount = rs.getInt("buycount");
		
		return buycount;
	}

}
