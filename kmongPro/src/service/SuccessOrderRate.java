package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SuccessOrderRate {

	public int calsucessrate(Connection conn, String m_email) throws SQLException {
		
		int cancelCount=0;
		int completeCount=0;
		int re = 0;
		String sql = "select count(*) cancelCount\r\n" + 
				"from\r\n" + 
				"(select distinct t.t_seq\r\n" + 
				"from\r\n" + 
				"(select t_seq\r\n" + 
				"from talent\r\n" + 
				"where m_email=?) t\r\n" + 
				"join t_option opt\r\n" + 
				"on opt.t_seq=t.t_seq\r\n" + 
				"join payment_list pl\r\n" + 
				"on pl.t_seq=opt.t_seq and pl.op_seq=opt.op_seq\r\n" + 
				"join payment p\r\n" + 
				"on p.p_seq=pl.p_seq\r\n" + 
				"join t_order ord\r\n" + 
				"on ord.p_seq=p.p_seq\r\n" + 
				"join progress prog\r\n" + 
				"on prog.order_num=ord.order_num\r\n" + 
				"where p_state='취소' )";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		rs=pstmt.executeQuery();
		rs.next();
		cancelCount = rs.getInt("cancelCount");
		
		sql = "select count(*) completeCount\r\n" + 
				"from\r\n" + 
				"(select distinct t.t_seq\r\n" + 
				"from\r\n" + 
				"(select t_seq\r\n" + 
				"from talent\r\n" + 
				"where m_email=?) t\r\n" + 
				"join t_option opt\r\n" + 
				"on opt.t_seq=t.t_seq\r\n" + 
				"join payment_list pl\r\n" + 
				"on pl.t_seq=opt.t_seq and pl.op_seq=opt.op_seq\r\n" + 
				"join payment p\r\n" + 
				"on p.p_seq=pl.p_seq\r\n" + 
				"join t_order ord\r\n" + 
				"on ord.p_seq=p.p_seq\r\n" + 
				"join progress prog\r\n" + 
				"on prog.order_num=ord.order_num\r\n" + 
				"where p_state='완료') ";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		rs=pstmt.executeQuery();
		rs.next();
		completeCount = rs.getInt("completeCount");
		
		if(cancelCount==0 || completeCount==0) {
			re=0;
		}else {
			re = cancelCount/completeCount*100;
		}
		
		return re;
	}

}
