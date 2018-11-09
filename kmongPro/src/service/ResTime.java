package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResTime {

	public String calrestime(Connection conn, String m_email) throws SQLException {
		
		String sql = "select res_time(?) res_time from dual";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		
		rs = pstmt.executeQuery();
		rs.next();
		
		String restime = rs.getString("res_time");
		
		if(restime==null) {
			restime="아직몰라요";
		}
		
		return restime;
	}

}
