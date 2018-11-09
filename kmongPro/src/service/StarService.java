package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StarService {

	public ArrayList<StarInfo> selectStarList(Connection conn) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select avg(e_star) e_star, t_seq, count(*) count\r\n" + 
				"from evaluation e\r\n" + 
				"join t_order o\r\n" + 
				"on o.order_num=e.order_num\r\n" + 
				"join payment_list pl\r\n" + 
				"on pl.p_seq=o.p_seq\r\n" + 
				"group by t_seq ";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		ArrayList<StarInfo> starList = new ArrayList<>();
		
		while(rs.next()) {
			StarInfo starInfo = new StarInfo(rs.getDouble("e_star"),rs.getInt("t_seq"),rs.getInt("count"));
			//System.out.println(rs.getDouble("e_star"));
			starList.add(starInfo);
		}
		
		return starList;
	}
	
}
