package talent_register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import category.CategoryDTO;
import command.CommandHandler;

public class IndexHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");*/
		
		Connection conn = DBConn.getConnection();
		String sql="select c_id, c_group from category where c_superid = 0"; 
		
		PreparedStatement pstmt = conn.prepareStatement	(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<CategoryDTO> firstList = new ArrayList<>();
		while (rs.next()) {
			CategoryDTO dto = new CategoryDTO();
			dto.setC_id(rs.getInt(1));
			dto.setC_group(rs.getString(2));
			firstList.add(dto);
	}
	
	request.setAttribute("firstList", firstList);

	return "/WEB-INF/view/talent_register/insert_first.jsp";
}

}
