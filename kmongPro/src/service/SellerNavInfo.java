package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SellerNavInfo {

	public int SellerNavInfo(String my_email, Connection conn) throws SQLException {
		String sql = "select mm_money\r\n" + 
				"from  master_milege\r\n" + 
				"where m_email=? ";
		int money=0;
		ResultSet rs = null;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, my_email);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			money = rs.getInt(1);
			System.out.println("mm_money="+money);			
		}
		return money;
	}
	
	
}
