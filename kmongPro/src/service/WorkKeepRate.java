package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WorkKeepRate {

	public int calworkkeeprate(Connection conn, String m_email) throws SQLException {
		int totcount = 0;
		int dcount =0;
		int re=0;
		String sql = "select count(*) totcount\r\n" + 
				"from\r\n" + 
				"(select distinct prog.order_num,deadline,c_date\r\n" + 
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
				"join completed comp\r\n" + 
				"on comp.order_num=prog.order_num\r\n" + 
				"where sysdate-c_date<60)";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		rs=pstmt.executeQuery();
		rs.next();
		totcount=rs.getInt("totcount");
		
		sql="select count(*) dcount\r\n" + 
				"from\r\n" + 
				"(select distinct prog.order_num,deadline,c_date\r\n" + 
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
				"join completed comp\r\n" + 
				"on comp.order_num=prog.order_num\r\n" + 
				"where to_date(deadline)-to_date(c_date)>= 0 and sysdate-c_date<60) ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		rs=pstmt.executeQuery();
		rs.next();
		dcount=rs.getInt("dcount");
		
		if(totcount==0 || dcount==0) {
			re=0;
		}else{
			re=dcount/totcount*100;
		}
		return re;
	}

}
