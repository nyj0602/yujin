package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

public class MemberDAO {
 private static MemberDAO memberDAO = null;
 
/* private MemberDAO() {
	 
 }
 
 public static MemberDAO getInstance() {
	 if(memberDAO == null) {
		 memberDAO = new MemberDAO();
	 }
	 return memberDAO;
 }*/
 
public MemberDTO selectById(Connection conn, String m_email) throws SQLException{
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from member where m_email=?";
	
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		rs=pstmt.executeQuery();
		MemberDTO memberDTO = null;
		
		if(rs.next()) {
			memberDTO =new MemberDTO(rs.getString("m_email"), rs.getString("m_name"), rs.getString("m_pwd"), rs.getString("m_sep"), rs.getString("m_profile"));
		}
		return memberDTO;
	}finally {
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
	}
}
 
	

public String searchEmail(Connection conn, String m_email) throws SQLException {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select m_email from member where m_email=?";

	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		rs = pstmt.executeQuery();
		String check = null;
		while(rs.next()) {
			check = rs.getString(1);
		};
		
		return check;
			
		
	} finally {
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
	}
}

public String searchPwd(Connection conn, String m_email, String m_pwd) throws Exception{
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	searchEmail(conn, m_email);
	String sql = "select m_email from member where m_email=? and m_pwd=?";

	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		pstmt.setString(2, m_pwd);
		rs = pstmt.executeQuery();
		String check = null;
		while(rs.next()) {
			check = rs.getString(1);
		};			
		System.out.println("check 값"+check);
		return check;
		
	} finally {
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
	}
	
	
}
 
 
}
