package talent_register;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class AjaxCatsecHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//Connection conn = null;
		Connection conn = DBConn.getConnection();
		Statement  stmt = conn.createStatement();
		/*Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");*/
		String sql = "select c_superid, c_group, c_id from category where c_superid = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		int sel_first = Integer.parseInt(request.getParameter("sel_first"));
		pstmt.setInt(1, sel_first);
		ResultSet rs = pstmt.executeQuery();

		JSONArray jarr = new JSONArray();
		// jarr 
		while (rs.next()) {
			int c_superid = rs.getInt(1);
			String c_group = rs.getString(2);
			int c_id = rs.getInt(3);

			JSONObject categoryobj = new JSONObject();
			//System.out.println(c_superid);
			//System.out.println(c_group);
			categoryobj.put("c_superid", c_superid);
			categoryobj.put("c_group", c_group);
			categoryobj.put("c_id", c_id);
			
			jarr.add(categoryobj);		
		}
		 request.setAttribute("jarr", jarr); 
		 //System.out.println("> > > " + jarr.toString());
		
		 
		return "/WEB-INF/view/talent_register/insert_firstView.jsp";
		

	}

}