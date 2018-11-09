package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

public class MasterRankService {

	public ArrayList<MasterRankInfo> getMasterTop5(Connection conn) throws SQLException{

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select rownum,m_name,m_profile,total_price\r\n" + 
				"from\r\n" + 
				"(select m.m_name,m.m_profile,sum(p_price) total_price\r\n" + 
				"from member m\r\n" + 
				"join payment p\r\n" + 
				"on m.m_email=p.m_email\r\n" + 
				"join t_order od\r\n" + 
				"on od.p_seq=p.p_seq\r\n" + 
				"join completed c\r\n" + 
				"on c.order_num=od.order_num\r\n" + 
				"where c.order_num = od.order_num\r\n" + 
				"group by m.m_name,m.m_profile\r\n" + 
				"order by 3 desc) t\r\n" + 
				"where rownum <=5 ";
		
		pstmt=conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		ArrayList<MasterRankInfo> masterInfoList = new ArrayList<>();
		
		while(rs.next()) {
			MasterRankInfo masterRankInfo = new MasterRankInfo();
			masterRankInfo.setRownum(rs.getInt("rownum"));
			masterRankInfo.setM_name(rs.getString("m_name"));
			masterRankInfo.setM_profile(rs.getString("m_profile"));
			masterRankInfo.setTotal_price(rs.getInt("total_price"));
			
			masterInfoList.add(masterRankInfo);
			
		}
		
		return masterInfoList;
	}
	
}
