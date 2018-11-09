package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MyTotalTalent {

	public int selectTalentCount(Connection conn, String m_email) throws SQLException {

		String sql = "select count(*) sellcount\r\n" + 
				"from talent\r\n" + 
				"where m_email=? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		
		rs = pstmt.executeQuery();
		
		rs.next();
		
		int myTotalTalentcount =rs.getInt("sellcount");
		
		return myTotalTalentcount;
	}

}
