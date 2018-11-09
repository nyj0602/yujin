package sell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import javafx.scene.input.DataFormat;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
// 차트아냐 수익금 출금이야....
public class WithdrawHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn=DBConn.getConnection();
		
		String id = "nyj0602@naver.com"; // 세션 받아와서 저장

		JSONArray result = new JSONArray();		
		JSONArray count = new JSONArray();
		
		String query = "select nvl2(pm_name, pm_name, cm_name) name , nvl2(ps_count, ps_count, cs_count) count ,  nvl2(per_member.b_seq, per_member.b_seq, com_member.b_seq) b_seq from member " + 
				"left outer join (select per_member.m_email, per_member.pm_name, per_seller.ps_count, b_seq from per_member join per_seller on per_seller.m_email=per_member.m_email ) per_member on per_member.m_email = member.m_email " + 
				"left outer join (select com_member.m_email, com_member.cm_name, com_seller.cs_count, b_seq from com_member join com_seller on com_seller.m_email=com_member.m_email ) com_member on com_member.m_email=member.m_email " + 
				"where member.m_sep like '%판매%' and member.m_email=?";
		
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);

		rs=pstmt.executeQuery();
		
		while (rs.next()) {
			count.add(rs.getString(1));
			count.add(rs.getString(2));
			count.add(rs.getInt(3));
		}
		
		
		query = "insert into profits (pf_seq, order_num, pf_price, pf_sep, pf_date ) " + 
				"select profits_seq.nextval, order_num, pf_price, nvl2(pf_sep, '출금신청',''), sysdate " + 
				"from ( " + 
				"select distinct g_profits.pf_seq, profits.pf_sep pf_sep, profits.pf_price pf_price, t_order.order_num order_num, payment_done.pd_date, money.pay_money, g_profits.pf_date " + 
				"from (select t_seq from talent where m_email=?) talent join payment_list on payment_list.t_seq=talent.t_seq  " + 
				"join t_order on t_order.p_seq = payment_list.p_seq join profits on profits.order_num = t_order.order_num  " + 
				"join (select order_num, max(pf_date) pf_date, max(pf_seq) pf_seq from profits group by order_num) g_profits on profits.pf_date=g_profits.pf_date and profits.pf_seq=g_profits.pf_seq " + 
				"join payment_done on payment_done.p_seq = t_order.p_seq " + 
				"join (select payment.p_seq p_seq, nvl2(cash_use.cu_deduction, payment.p_price + cash_use.cu_deduction, payment.p_price) pay_money from payment left outer join cash_use on payment.p_seq = cash_use.p_seq ) money on money.p_seq = t_order.p_seq " + 
				"where pf_sep like '출금가능' " + 
				")";
		
		try {
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			result.add(pstmt.executeUpdate());  
			
			conn.commit();
			} catch(SQLException e) {
				conn.rollback();
				
			}
			
		
		query = "insert into cash_refund (cr_seq, cr_count, cr_name, cr_state, cr_sep, b_seq, m_email) values (cash_refund_seq.nextval, ?, ?, 0, '수익금', ?, ?)";
		
		
		try {
			conn.setAutoCommit(false);
			pstmt=conn.prepareStatement(query);
			
			pstmt.setString(2, count.getString(0));
			pstmt.setString(1, count.getString(1));
			pstmt.setInt(3, count.getInt(2));
			pstmt.setString(4, id);
			
			result.add(pstmt.executeUpdate());  
			
			conn.commit();
			
			} catch(SQLException e) {
				
				conn.rollback();
				
			}
		
		request.setAttribute("data", result);
		
		
		return "/WEB-INF/view/sell/vacation.jsp";
	}

}
