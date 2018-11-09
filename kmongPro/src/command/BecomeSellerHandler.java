package command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

public class BecomeSellerHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = ConnectionProvider.getConnection();
		String sql = "select count(*) count\r\n" + 
				"from completed";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		pstmt=conn.prepareStatement(sql);
		pstmt.executeQuery();
		rs =pstmt.executeQuery();
		rs.next();
		int count = rs.getInt("count");
		request.setAttribute("count", count);
		
		sql = "select sum(p_price) sumprice\r\n" + 
				"from payment p\r\n" + 
				"join t_order ord\r\n" + 
				"on ord.p_seq=p.p_seq\r\n" + 
				"join completed comp\r\n" + 
				"on ord.order_num=comp.order_num ";
		
		pstmt=conn.prepareStatement(sql);
		pstmt.executeQuery();
		rs =pstmt.executeQuery();
		rs.next();
		int sumprice = rs.getInt("sumprice");
		request.setAttribute("sumprice", sumprice);
		
		
		sql = "select count(*) todaytot \r\n" + 
				"from talent\r\n" + 
				"where to_char(t_date,'yyyymmdd')=to_char(sysdate,'yyyymmdd')";
		pstmt=conn.prepareStatement(sql);
		pstmt.executeQuery();
		rs =pstmt.executeQuery();
		rs.next();
		int todayservice = rs.getInt("todaytot");
		request.setAttribute("todayservice", todayservice);
		
		System.out.println("todayservice"+todayservice);
		
		return "/WEB-INF/view/seller/become_a_seller.jsp";
	}
	
}
