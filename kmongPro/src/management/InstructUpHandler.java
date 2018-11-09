package management;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;

public class InstructUpHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");
		PreparedStatement  pstmt = null;

		String file = request.getParameter("file");
		int ordernum = Integer.parseInt(request.getParameter("orderNum"));
		System.out.println(file);
		System.out.println(ordernum);
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat date = new SimpleDateFormat("yy.MM.dd hh:mm");
		String datetime = date.format(cal.getTime());
		String sql = "";
		try {
			
			sql = " insert into process_list (pl_seq,pl_sender,pl_content,pl_file,pl_sendtime,pl_check,order_num) values(PROLIST_SEQ.NEXTVAL,'kmong','요청사항 작성완료','"+file+"',sysdate ,1 ,? )";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ordernum);
			pstmt.executeUpdate();
			
			sql = " insert into process_list (pl_seq,pl_sender,pl_content,pl_file,pl_sendtime,pl_check,order_num) values(PROLIST_SEQ.NEXTVAL,'kmong','작업시작',' ',sysdate ,1 ,? )";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ordernum);
			pstmt.executeUpdate();
			
			sql = " update progress set p_state = '진행중' where order_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ordernum);
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println(e.toString());
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			 //if (conn != null) try { conn.close();} catch (Exception e) { }
		}
		request.setAttribute("file", file);
		request.setAttribute("datetime", datetime);
		request.setAttribute("complete", "complete");
		return "/WEB-INF/view/management/Instructcheck.jsp";
	}

}
