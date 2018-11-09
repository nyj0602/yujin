package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Res_rateService {

	public int calResRate(Connection conn, String m_email) throws SQLException {
		
		String sql = "select res_rate(?) resrate from dual";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		rs =pstmt.executeQuery();
		rs.next();
		
		int resRate =rs.getInt("resrate");
		
		return resRate;
	}

}
