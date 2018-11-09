package grade;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class G_BaseHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		/*Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");*/
		
		Connection conn = DBConn.getConnection();
		String sql = "select GS_SEQ, M_EMAIL FROM Grade"; 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		ArrayList<GradeDTO> gradeList = new ArrayList<>();
		while (rs.next()) {
			GradeDTO dto = new GradeDTO();
			dto.setGs_seq(rs.getInt(1));
			dto.setM_email(rs.getString(2));
			gradeList.add(dto);
		}
		 request.setAttribute("gradeList", gradeList); 
		 
		
		 
		return "/WEB-INF/view/grade/grade.jsp";
		
	}
	

}
