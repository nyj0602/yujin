package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class WorkService {

	public JSONArray selectWork(Connection conn, String m_email) throws SQLException {
		
		String sql = "select a.p_seq,req_list,p_state,m_name \r\n" + 
				"from\r\n" + 
				"(select p.p_seq,req_list,p_state\r\n" + 
				"from payment p\r\n" + 
				"join t_order ord\r\n" + 
				"on ord.p_seq=p.p_seq\r\n" + 
				"join progress prog\r\n" + 
				"on prog.order_num=ord.order_num) a\r\n" + 
				"join \r\n" + 
				"(select distinct p.p_seq,m_name\r\n" + 
				"from member m\r\n" + 
				"join talent t\r\n" + 
				"on m.m_email=t.m_email\r\n" + 
				"join t_option opt\r\n" + 
				"on opt.t_seq=t.t_seq\r\n" + 
				"join payment_list pl\r\n" + 
				"on pl.t_seq=opt.t_seq and pl.op_seq=pl.op_seq\r\n" + 
				"join payment p\r\n" + 
				"on p.p_seq=pl.p_seq\r\n" + 
				"where p.m_email=?) b\r\n" + 
				"on b.p_seq=a.p_seq " +
				"where req_list is null ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		
		rs = pstmt.executeQuery();
		
		JSONArray dataArr = new JSONArray();
	
		while(rs.next()) {
			
			JSONObject data = new JSONObject();
			data.put("p_seq", rs.getInt("p_seq"));
			data.put("req_list", rs.getString("req_list"));
			data.put("p_state", rs.getString("p_state"));
			data.put("m_name", rs.getString("m_name"));
			
			
			dataArr.add(data);
		}
	
		
		return dataArr;
	}

}
