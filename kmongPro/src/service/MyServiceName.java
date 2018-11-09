package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MyServiceName {

	public ArrayList<AdvertiseInfo> serviceList(Connection conn, String m_email) throws SQLException {
		
		ArrayList<AdvertiseInfo> myserviceNameList = new ArrayList<>();
		String sql = "select t_seq, t_name\r\n" + 
				"from member m\r\n" + 
				"join talent t\r\n" + 
				"on m.m_email=t.m_email\r\n" + 
				"where m.m_email=? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			AdvertiseInfo advertiseInfo = new AdvertiseInfo(rs.getInt("t_seq"),rs.getString("t_name"));
			myserviceNameList.add(advertiseInfo);
		}
		
		return myserviceNameList;
	}
	
}
