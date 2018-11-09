package category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.JdbcUtil;

public class CategoryDAO {
	/*public CategoryDTO selectBy_c_id(Connection conn, String c_id) {
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		
	}*/
	
	public ArrayList<CategoryDTO> selectAll_category(Connection conn) throws SQLException {
		String sql ="select * from category where c_level=1";
		System.out.println(sql);
		PreparedStatement pstmt= null;
		//Statement stmt = null;
		ResultSet rs = null;

		ArrayList<CategoryDTO> categoryList = new ArrayList<>();
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			//stmt = conn.createStatement();
			//rs = stmt.executeQuery(sql);
			int c_id, c_superid, c_level;
			String c_group;

			while (rs.next()) {
				CategoryDTO categoryDTO = new CategoryDTO();
				c_id = rs.getInt("c_id");
				c_superid = rs.getInt("c_superid");
				c_level = rs.getInt("c_level");
				c_group = rs.getString("c_group");
				System.out.println(c_level);
				categoryDTO.setC_id(c_id);
				categoryDTO.setC_superid(c_superid);
				categoryDTO.setC_level(c_level);
				categoryDTO.setC_group(c_group);
				
				categoryList.add(categoryDTO);
			}
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			//JdbcUtil.close(stmt);
		}
		return categoryList;
	}
}
