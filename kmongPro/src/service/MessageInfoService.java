package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class MessageInfoService {

	public JSONArray messageInfoService(Connection conn, String m_email) throws SQLException {

		String sql = "select *\r\n" + "from(\r\n"
				+ "select t_seq, buy_email, msg_seq, msg_content, msg_send, msg_ck, msg_sender, t_name, image, seller_name, seller_profile, order_num, p_state, row_number()over(partition by msg_seq order by t_seq) cnt\r\n"
				+ "from (\r\n"
				+ "select t_seq, buy_email, msg_seq, msg_content, msg_send, msg_ck, msg_sender, t_name, image, seller.m_name seller_name, seller.m_profile seller_profile, order_num, p_state\r\n"
				+ "from\r\n" + "(select mr_seq, t_seq, buy_email\r\n" + "from msg_relation\r\n"
				+ "where buy_email=?) mr\r\n" + "join message msg\r\n" + "on msg.mr_seq=mr.mr_seq\r\n"
				+ "join talent t\r\n" + "on t.t_seq=mr.t_seq\r\n" + "join\r\n" + "(select i1.i_seq,image,i1.t_seq\r\n"
				+ "from image i1\r\n" + "join\r\n" + "(select min(i_seq) i_seq,t_seq\r\n" + "from image\r\n"
				+ "group by t_seq) i2\r\n" + "on i1.i_seq=i2.i_seq) mainimage\r\n" + "on mainimage.t_seq=t.t_seq\r\n"
				+ "join member seller\r\n" + "on seller.m_email=msg.msg_sender\r\n" + "join\r\n"
				+ "(select p.p_seq, p.m_email, t_order.order_num, p_state\r\n" + "from payment p\r\n"
				+ "join t_order \r\n" + "on t_order.p_seq=p.p_seq\r\n" + "join progress pr\r\n"
				+ "on pr.order_num=t_order.order_num\r\n" + "where m_email=?) memberorder\r\n"
				+ "on memberorder.m_email=mr.buy_email) t1\r\n" + ")\r\n" + "where cnt > 1 ";

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, m_email);
		pstmt.setString(2, m_email);

		rs = pstmt.executeQuery();

		int alarmcount=0;
		JSONArray dataArr = new JSONArray();
		 while(rs.next()) {
			 JSONObject data = new JSONObject();
			 
        Date d = new Date();
        Date msgDate = rs.getDate("msg_send");
        long msg_send = (d.getTime()-msgDate.getTime()) / (24*60*60*1000*7);

		
		data.put("t_seq", rs.getInt("t_seq"));
		data.put("buy_email", rs.getString("buy_email"));
		data.put("msg_seq", rs.getInt("msg_seq"));
		data.put("msg_content", rs.getString("msg_content"));
		data.put("msg_send", msg_send);
		data.put("msg_sender", rs.getString("msg_sender"));
		data.put("t_name", rs.getString("t_name"));
		data.put("image", rs.getString("image"));
		data.put("seller_name", rs.getString("seller_name"));
		data.put("seller_profile", rs.getString("seller_profile"));
		data.put("order_num", rs.getInt("order_num"));
		data.put("p_state", rs.getString("p_state"));
		data.put("msg_ck", rs.getInt("msg_ck"));
		dataArr.add(data);
		 }

		return dataArr;
	}

}
