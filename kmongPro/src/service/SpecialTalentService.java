package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SpecialTalentService {

	public ArrayList<SpecialTalentInfo> selectTalent(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select m_name, m_email,m_profile,t_seq,t_name,image,op_price\r\n" + 
				"from\r\n" + 
				"(select m.m_name, m.m_email,m.m_profile,t.t_seq,t_name,image,op_price\r\n" + 
				"from member m\r\n" + 
				"join talent t\r\n" + 
				"on m.m_email=t.m_email\r\n" + 
				"join\r\n" + 
				"(select i1.i_seq,image,i1.t_seq\r\n" + 
				"from image i1\r\n" + 
				"join\r\n" + 
				"(select min(i_seq) i_seq,t_seq\r\n" + 
				"from image\r\n" + 
				"group by t_seq) i2\r\n" + 
				"on i1.i_seq=i2.i_seq) mainimage\r\n" + 
				"on mainimage.t_seq=t.t_seq\r\n" + 
				"join (select op_seq,op_price,t_seq\r\n" + 
				"from t_option\r\n" + 
				"where op_sep='standard') opt\r\n" + 
				"on opt.t_seq=t.t_seq\r\n" + 
				"join tal_state ts\r\n" + 
				"on ts.t_seq=t.t_seq\r\n" + 
				"where ts_name='판매중'\r\n" + 
				"order by dbms_random.value)\r\n" + 
				"where rownum <= 20 ";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		ArrayList<SpecialTalentInfo> specialTalentInfoList = new ArrayList<>();
		while(rs.next()) {
			SpecialTalentInfo specialTalentInfo = new SpecialTalentInfo(rs.getString("m_name"),rs.getString("m_email"),rs.getString("m_profile"),rs.getInt("t_seq"),rs.getString("t_name"),rs.getString("image"),rs.getInt("op_price"));
			specialTalentInfoList.add(specialTalentInfo);
		}
		return specialTalentInfoList;
	}

}
