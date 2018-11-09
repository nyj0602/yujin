package refund;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;

public class ReturnHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		/*Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");*/
		
		Connection conn = DBConn.getConnection();
		String sql="select b_seq, b_name from bank"; 
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<BankDTO> bankList = new ArrayList<>();
		while (rs.next()) {
			BankDTO dto = new BankDTO();
			dto.setB_seq(rs.getInt(1));
			dto.setB_name(rs.getString(2));
			bankList.add(dto);
	}
	
	request.setAttribute("bankList", bankList);
		
		return "/WEB-INF/view/refund/cashreturn.jsp";
	}

}
