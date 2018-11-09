package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import net.sf.json.JSON;

public class HeartService {

	public ArrayList<HeartInfo> getHeartInfo(Connection conn, String m_email) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select m_email,t_seq\r\n" + 
				"from heart\r\n" + 
				"where m_email=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		rs = pstmt.executeQuery();
		
		ArrayList<HeartInfo> heartInfoList = new ArrayList<>();
		while(rs.next()) {
			HeartInfo heartInfo = new HeartInfo(rs.getString("m_email"),rs.getInt("t_seq"));
			heartInfoList.add(heartInfo);
		}
		return heartInfoList;
	}

	public int insertHeart(Connection conn, String m_email, int t_seq) throws SQLIntegrityConstraintViolationException{
		String sql = "insert into heart values(?,?) ";
		
		PreparedStatement pstmt = null;
		int re =0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_email);
			pstmt.setInt(2, t_seq);
			re=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return re;
	}

	public void deleteHeart(Connection conn,String m_email ,int t_seq) throws SQLException {
		String sql = "delete from heart where m_email=? and t_seq=? ";
		
		PreparedStatement pstmt = null;
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		pstmt.setInt(2, t_seq);
		pstmt.executeQuery();
		
	}
	
}
