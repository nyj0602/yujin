package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProfileComplete {

	public int calCompleteprofile(Connection conn, String m_email) throws SQLException {
		
		String sql = "select m_profile,m_intro, m_intros, ml_seq, mc_seq\r\n" + 
				"from\r\n" + 
				"(select m_email,m_profile,m_intro, m_intros\r\n" + 
				"from member\r\n" + 
				"where m_email=?) m\r\n" + 
				"join m_license ml\r\n" + 
				"on ml.m_email=m.m_email\r\n" + 
				"join m_career mc\r\n" + 
				"on mc.m_email=m.m_email\r\n" + 
				"where rownum=1";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		
		rs = pstmt.executeQuery();
		
		rs.next();
		
		int completenum=0;
		if(rs.getString("m_profile")!="") {
			completenum+=30;
		}
		if(rs.getString("m_intro")!="") {
			completenum+=15;
		}
		if(rs.getString("m_intros")!=""){
			completenum+=15;
		}
		if(rs.getInt("ml_seq")!=0) {
			completenum+=10;
		}
		if(rs.getInt("mc_seq")!=0) {
			completenum+=15;
		}
		
		
		
		return completenum;
	}

}
