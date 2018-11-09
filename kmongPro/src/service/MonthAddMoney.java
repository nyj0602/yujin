package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MonthAddMoney {

	public int totalcalmony(Connection conn, String m_email) throws SQLException {
		String sql = "select NVL(sum(p_price),0) getmoney\r\n" + 
				"from (select * from talent where m_email=?) t\r\n" + 
				"join t_option opt\r\n" + 
				"on t.t_seq=opt.t_seq\r\n" + 
				"join payment_list pl\r\n" + 
				"on pl.t_seq=opt.t_seq and pl.op_seq=opt.op_seq\r\n" + 
				"join payment p\r\n" + 
				"on p.p_seq=pl.p_seq\r\n" + 
				"join t_order ord\r\n" + 
				"on ord.p_seq=p.p_seq\r\n" + 
				"join completed comp\r\n" + 
				"on comp.order_num=ord.order_num\r\n" + 
				"where c_date between to_char(add_months(sysdate,-1),'yyyy-mm-dd') and sysdate ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "m_email");
		
		rs = pstmt.executeQuery();
		
		rs.next();
		
		int getmoney=rs.getInt("getmoney");


		
		return getmoney;
	}

}
