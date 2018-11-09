package management;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;

public class ErrorRequestHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");
		PreparedStatement  pstmt = null;
		ResultSet rs = null;
		String sql = "";
		System.out.println("error");
		String sp_num = request.getParameter("problem");
		String method = request.getParameter("resolutionMethod");
		String ordernum = request.getParameter("ordernum");
		System.out.println(sp_num);
		System.out.println(method);
		System.out.println(ordernum);
		try {
			if (method.equals("addpay")) {
			String content = request.getParameter("content");
			String price = request.getParameter("price");
			String term = request.getParameter("term");
			
			sql = " insert into solution values(solution_seq.nextval, '추가 결제',?) ";
			pstmt.setString(1, ordernum);
			pstmt.setString(2, sp_num);
			pstmt.executeUpdate();
			
			sql= " insert into problum values (?, problum_seq.nextval, '0',solution_seq.CURRVAL) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			pstmt.executeUpdate();
			
			sql = "insert into add_payment values(addpay.nextval, ?,1,?,0,problum_seq.CURRVAL,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, term);
			pstmt.setString(2, price);
			pstmt.setString(3, ordernum);
			pstmt.executeUpdate();
			
		}	else {
			String refund =  request.getParameter("refund") ;
			System.out.println(refund);
			sql = " insert into solution values(solution_seq.nextval, '취소',?) ";
			pstmt.setString(1, sp_num);
			pstmt.executeUpdate();
			
			sql= " insert into problum values (?, problum_seq.nextval, '0',solution_seq.CURRVAL) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			pstmt.executeUpdate();
			
			sql = "insert into refund values(?,problum_seq.CURRVAL, sysdate,?,sysdate,'admin01')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			pstmt.setString(2, refund);
			pstmt.executeUpdate();
		}
			
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
		request.setAttribute("complete", "complete");
		return "/WEB-INF/view/management/deliverycheck.jsp";
	}

}
