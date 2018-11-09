package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import category.CategoryDTO;

public class CategoryHeader {

	public ArrayList<CategoryDTO> getCategory(Connection conn) throws SQLException {
		
		String sql ="select * \r\n" + 
				"from category\r\n" + 
				"where c_level<=2\r\n" + 
				"start with c_superid=0\r\n" + 
				"connect by prior c_id = c_superid";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<CategoryDTO> categoryList = new ArrayList<>();
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
//		int c_id, c_superid, c_level;
//		String c_group;
		
		while(rs.next()) {
			CategoryDTO categoryDTO = new CategoryDTO(rs.getInt("c_id"),rs.getInt("c_superid"),rs.getInt("c_level"),rs.getString("c_group"));
			categoryList.add(categoryDTO);
		}
		
		return categoryList;
	}

}
