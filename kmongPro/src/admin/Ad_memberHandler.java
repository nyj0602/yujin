package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import jdk.nashorn.internal.scripts.JS;
import net.sf.json.JSONArray;

public class Ad_memberHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("adminhandler**");
		
		String mail = request.getParameter("mail");
		
		System.out.println("> "+mail);
		
		Connection conn = null;
		conn=DBConn.getConnection();
		PreparedStatement pstmt = null;
		
		JSONArray result = new JSONArray();
		
		String query = "update member set m_wdraing=1 where m_email=?";
		
		try {
			conn.getAutoCommit();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mail);
			result.add(pstmt.executeUpdate());
			
			conn.commit();
		} catch (Exception ex) {
			conn.rollback();
			System.out.println(ex.toString());
			
		}
		
		request.setAttribute("data", result);
		
		
		return "/WEB-INF/view/sell/vacation.jsp";
	}

}
