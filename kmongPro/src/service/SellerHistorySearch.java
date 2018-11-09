package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SellerHistorySearch {

	public ArrayList<sellerInfo> sellerHistorySearch(String my_email, String type, String keyword, Connection conn) throws SQLException {
		String searchKeyword="%"+keyword+"%";
		System.out.println("searchKeyword = " + searchKeyword);
		
		String sql ="select m.m_email, m.m_profile, p.p_price, p.p_term, pg.req_list, pg.deadline, pg.p_state, o.p_seq, o.order_num, c.c_date, ot.op_price, t.t_seq, t.t_name \r\n" + 
				"from member m\r\n" + 
				"join payment p on m.m_email=p.m_email\r\n" + 
				"join t_order o on p.p_seq=o.p_seq\r\n" + 
				"join progress pg on pg.order_num=o.order_num\r\n" + 
				"join completed c on o.order_num=c.order_num\r\n" + 
				"join payment_list pl on p.p_seq=pl.p_seq\r\n" + 
				"join t_option ot on ot.t_seq=pl.t_seq and ot.op_seq=pl.op_seq\r\n" + 
				"join talent t on t.t_seq=ot.t_seq\r\n" + 
				"join image i on i.t_seq=ot.t_seq\r\n" + 
				"where m.m_email=?\r\n" + 
				"and pg.p_state=?\r\n" + 
				"and m.m_name like ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, my_email);
		pstmt.setString(2, type);
		pstmt.setString(3, searchKeyword);
		pstmt.executeQuery();
		
		sellerInfo sInfo = new sellerInfo(
				rs.getString("m_email")
				,rs.getString("m_profile")
				,rs.getInt("p_price")
				,rs.getInt("p_term")
				,rs.getString("req_list")
				,rs.getDate("deadline")
				,rs.getString("p_state")
				,rs.getDate("c_date")
				,rs.getInt("op_price")
				,rs.getInt("t_seq")
				,rs.getString("t_num")
				,rs.getInt("order_num")
				);
		ArrayList<sellerInfo> searchSellerHistoryList = new ArrayList<>();
		searchSellerHistoryList.add(sInfo);
		
		return searchSellerHistoryList;
	}

}
