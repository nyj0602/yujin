package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MasterMileageService {

	public int selectMileage(Connection conn, String m_email) throws SQLException {
		String sql="select m_email, mm_money\r\n" + 
				"from master_milege\r\n" + 
				"where m_email=? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		
		rs = pstmt.executeQuery();
		
		rs.next();
		
		int mm_money = rs.getInt("mm_money");
		
		return mm_money;
	}

}
