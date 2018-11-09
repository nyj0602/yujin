package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SellerHistoryState {
public ArrayList<sellerInfo> sellerHistoryType(String my_email, String type, Connection conn) throws SQLException {
		
	System.out.println("my_email = " + my_email + ", type = "+type);
	
		String sql="select m.m_email, m.m_profile, p.p_price, p.p_term, pg.req_list, pg.deadline, pg.p_state, o.p_seq, o.order_num, c.c_date, ot.op_price, t.t_seq, t.t_name \r\n" + 
				"from member m\r\n" + 
				"join payment p on m.m_email=p.m_email\r\n" + 
				"join t_order o on p.p_seq=o.p_seq\r\n" + 
				"join progress pg on pg.order_num=o.order_num\r\n" + 
				"join completed c on o.order_num=c.order_num\r\n" + 
				"join payment_list pl on p.p_seq=pl.p_seq\r\n" + 
				"join t_option ot on ot.t_seq=pl.t_seq and ot.op_seq=pl.op_seq\r\n" + 
				"join talent t on t.t_seq=ot.t_seq\r\n" + 
				"join image i on i.t_seq=ot.t_seq\r\n" + 
				"where m.m_email=? " + 
				"and pg.p_state=? ";

		System.out.println(sql);
		
		ResultSet rs =null;
		PreparedStatement pstmt = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, my_email);
		pstmt.setString(2, type);
		
		rs=pstmt.executeQuery();

		sellerInfo sellerInfo =new sellerInfo();
		ArrayList<sellerInfo> sellerInfoList = new ArrayList<>();
		
		while(rs.next()) {

			sellerInfo.setM_email(rs.getString("m_email"));
			sellerInfo.setM_profile(rs.getString("m_profile"));
			sellerInfo.setP_price(rs.getInt("p_price"));
			sellerInfo.setP_term(rs.getInt("p_term"));
			sellerInfo.setReq_list(rs.getString("req_list"));
			sellerInfo.setDeadline(rs.getDate("deadline"));
			sellerInfo.setP_state(rs.getString("p_state"));
			sellerInfo.setOrder_num(rs.getInt("order_num"));
			sellerInfo.setC_date(rs.getDate("c_date"));
			sellerInfo.setOp_price(rs.getInt("op_price"));
			sellerInfo.setT_seq(rs.getInt("t_seq"));
			sellerInfo.setT_name(rs.getString("t_name"));
			
			sellerInfoList.add(sellerInfo);
		}
		return sellerInfoList;
	}
}
