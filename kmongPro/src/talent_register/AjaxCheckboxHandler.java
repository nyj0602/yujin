package talent_register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class AjaxCheckboxHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
//System.out.println("핸들러넘어옴");
		//Connection conn = null;
		/*Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");*/
		Connection conn = DBConn.getConnection();
		String sql = "select c_superid, c_group, c_id, c_level from category where c_superid = ? and c_level=5";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		String gigMetadataLink1 = request.getParameter("gigMetadataLink1");
		pstmt.setString(1,gigMetadataLink1);
//System.out.println(gigMetadataLink1);
		
		ResultSet rs = pstmt.executeQuery();

		JSONArray jarr = new JSONArray();
		// jarr 
		while (rs.next()) {
			int c_superid = rs.getInt(1);
			String c_group = rs.getString(2);
			int c_id = rs.getInt(3);
			int c_level = rs.getInt(4);

			JSONObject categoryobj = new JSONObject();
			categoryobj.put("c_superid", c_superid);
			categoryobj.put("c_group", c_group);
			categoryobj.put("c_id", c_id);
			//categoryobj.put("c_level", c_level);
			
			jarr.add(categoryobj);		
		}
		 request.setAttribute("jarr", jarr); 
		 //System.out.println("> > > " + jarr.toString());
		
		 
		return "/WEB-INF/view/talent_register/insert_checkboxView.jsp";
		
	}

	
}
