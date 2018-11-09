package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelerCount {

	public int selectSelerCount(Connection conn) throws SQLException {
		String keyword = "%판매자%";
		String sql = "select count(*) count\r\n" + 
				"from member\r\n" + 
				"where m_sep like ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, keyword);
		
		rs = pstmt.executeQuery();
		rs.next();
		int count = rs.getInt("count");
		
		return count;
	}

}
