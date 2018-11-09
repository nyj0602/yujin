package sell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ChartHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("chartHandler");
		
		String id = "nyj0602@naver.com"; // 세션 받아와서 저장
		
		String type = request.getParameter("types") == null? "monthly" : request.getParameter("types");
		System.out.println(type);
		
		
		Connection conn = null;
		conn=DBConn.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query ="";
		
		Date now = new Date();
		SimpleDateFormat dsfm = new SimpleDateFormat("yyyy.MM");
		SimpleDateFormat dsfm2 = new SimpleDateFormat("yyyy.MM.dd");
		
		String dateset = "";
		JSONArray datearr = new JSONArray();
		
		
		
		JSONObject jobj = new JSONObject();
		
		if(type.contains("monthly")) {

			
			
			for (int i = 11; i >= 0; i--) {
				datearr.add(dsfm.format(new Date (now.getYear(), now.getMonth()-i, now.getDate() )) );
				dateset += "'" +dsfm.format(new Date (now.getYear(), now.getMonth()-i, now.getDate() )) + "'" + (i==0? "" : ", ");
			}
			
		jobj.put("term", datearr);
		System.out.println(datearr);
		// 주문 시작 
		query = "select * from ( " + 
				"select pf_date, pf_price from ( " + 
				"select distinct profits.pf_sep, profits.pf_price, t_order.order_num, to_char(payment_done.pd_date, 'yyyy.MM'), money.pay_money, to_char(profits.pf_date, 'yyyy.MM') pf_date  " + 
				"from (select t_seq from talent where m_email= ? ) talent join payment_list on payment_list.t_seq=talent.t_seq " + 
				"join t_order on t_order.p_seq = payment_list.p_seq join profits on profits.order_num = t_order.order_num " + 
				"join payment_done on payment_done.p_seq = t_order.p_seq " + 
				"join (select payment.p_seq p_seq, nvl2(cash_use.cu_deduction, payment.p_price + cash_use.cu_deduction, payment.p_price) pay_money from payment left outer join cash_use on payment.p_seq = cash_use.p_seq ) money on money.p_seq = t_order.p_seq " + 
				"where pf_sep like '%예상%')) " + 
				"pivot ( sum(pf_price) for pf_date in ( "+dateset+" ) )";
				
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		
		rs=pstmt.executeQuery();
		
		

		JSONArray on = new JSONArray();

		while (rs.next()) {
			for (int i = 1; i <= datearr.size(); i++) {
				on.add( rs.getInt(i) );
			}
		}
		
		jobj.put("on", on);
		System.out.println(on);

		
		
		//주문 취소		
		query = "select * from ( " + 
				"select pf_date, pf_price from ( " + 
				"select distinct profits.pf_sep, profits.pf_price, t_order.order_num, to_char(payment_done.pd_date, 'yyyy.MM'), money.pay_money, to_char(profits.pf_date, 'yyyy.MM') pf_date  " + 
				"from (select t_seq from talent where m_email= ? ) talent join payment_list on payment_list.t_seq=talent.t_seq " + 
				"join t_order on t_order.p_seq = payment_list.p_seq join profits on profits.order_num = t_order.order_num " + 
				"join payment_done on payment_done.p_seq = t_order.p_seq " + 
				"join (select payment.p_seq p_seq, nvl2(cash_use.cu_deduction, payment.p_price + cash_use.cu_deduction, payment.p_price) pay_money from payment left outer join cash_use on payment.p_seq = cash_use.p_seq ) money on money.p_seq = t_order.p_seq " + 
				"where pf_sep like '%취소%')) " + 
				"pivot ( sum(pf_price) for pf_date in ( "+dateset+" ) )";
				
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		
		rs=pstmt.executeQuery();
		
		
		JSONArray can = new JSONArray();

		while (rs.next()) {
			
			for (int i = 1; i <= datearr.size(); i++) {
				can.add(rs.getInt(i));
			}
		}
		
		jobj.put("can", can);
		System.out.println(can);

		
		
		// 주문 완료
		query = "select * from ( " + 
				"select pf_date, pf_price from ( " + 
				"select distinct profits.pf_sep, profits.pf_price, t_order.order_num, to_char(payment_done.pd_date, 'yyyy.MM'), money.pay_money, to_char(profits.pf_date, 'yyyy.MM') pf_date  " + 
				"from (select t_seq from talent where m_email= ? ) talent join payment_list on payment_list.t_seq=talent.t_seq " + 
				"join t_order on t_order.p_seq = payment_list.p_seq join profits on profits.order_num = t_order.order_num " + 
				"join payment_done on payment_done.p_seq = t_order.p_seq " + 
				"join (select payment.p_seq p_seq, nvl2(cash_use.cu_deduction, payment.p_price + cash_use.cu_deduction, payment.p_price) pay_money from payment left outer join cash_use on payment.p_seq = cash_use.p_seq ) money on money.p_seq = t_order.p_seq " + 
				"where pf_sep like '%출금가능%')) " + 
				"pivot ( sum(pf_price) for pf_date in ( "+dateset+" ) )";
				
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		
		rs=pstmt.executeQuery();
		
		
		JSONArray done = new JSONArray();	

		while (rs.next()) {
			
			for (int i = 1; i <= datearr.size(); i++) {
				done.add(rs.getInt(i));
			}
		}
		
		jobj.put("done", done);
		System.out.println(done);

		
		request.setAttribute("data", jobj);
		
		} else {
			
			for (int i = 29; i >= 0; i--) {
				datearr.add(dsfm2.format(new Date (now.getYear(), now.getMonth(), now.getDate()-i )) );
				dateset += "'" +dsfm2.format(new Date (now.getYear(), now.getMonth(), now.getDate()-i )) + "'" + (i==0? "" : ", ");
			}
			jobj.put("term", datearr);
			System.out.println(datearr);

			// 주문 시작 
			query = "select * from ( " + 
					"select pf_date, pf_price from ( " + 
					"select distinct profits.pf_sep, profits.pf_price, t_order.order_num, to_char(payment_done.pd_date, 'yyyy.MM.dd'), money.pay_money, to_char(profits.pf_date, 'yyyy.MM.dd') pf_date  " + 
					"from (select t_seq from talent where m_email= ? ) talent join payment_list on payment_list.t_seq=talent.t_seq " + 
					"join t_order on t_order.p_seq = payment_list.p_seq join profits on profits.order_num = t_order.order_num " + 
					"join payment_done on payment_done.p_seq = t_order.p_seq " + 
					"join (select payment.p_seq p_seq, nvl2(cash_use.cu_deduction, payment.p_price + cash_use.cu_deduction, payment.p_price) pay_money from payment left outer join cash_use on payment.p_seq = cash_use.p_seq ) money on money.p_seq = t_order.p_seq " + 
					"where pf_sep like '%예상%')) " + 
					"pivot ( sum(pf_price) for pf_date in ( "+dateset+" ) )";
					
			pstmt=conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			

			JSONArray on = new JSONArray();

			while (rs.next()) {
				
				for (int i = 1; i <= datearr.size(); i++) {
					on.add(rs.getInt(i));
				}
			}
			
			jobj.put("on", on);
			System.out.println(on);

			
			
			//주문 취소		
			query = "select * from ( " + 
					"select pf_date, pf_price from ( " + 
					"select distinct profits.pf_sep, profits.pf_price, t_order.order_num, to_char(payment_done.pd_date, 'yyyy.MM.dd'), money.pay_money, to_char(profits.pf_date, 'yyyy.MM.dd') pf_date  " + 
					"from (select t_seq from talent where m_email= ? ) talent join payment_list on payment_list.t_seq=talent.t_seq " + 
					"join t_order on t_order.p_seq = payment_list.p_seq join profits on profits.order_num = t_order.order_num " + 
					"join payment_done on payment_done.p_seq = t_order.p_seq " + 
					"join (select payment.p_seq p_seq, nvl2(cash_use.cu_deduction, payment.p_price + cash_use.cu_deduction, payment.p_price) pay_money from payment left outer join cash_use on payment.p_seq = cash_use.p_seq ) money on money.p_seq = t_order.p_seq " + 
					"where pf_sep like '%취소%')) " + 
					"pivot ( sum(pf_price) for pf_date in ( "+dateset+" ) )";
					
			pstmt=conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			
			JSONArray can = new JSONArray();

			while (rs.next()) {
				
				for (int i = 1; i <= datearr.size(); i++) {
					can.add(rs.getInt(i));
				}
			}
			
			jobj.put("can", can);
			System.out.println(can);

			
			
			// 주문 완료
			query = "select * from ( " + 
					"select pf_date, pf_price from ( " + 
					"select distinct profits.pf_sep, profits.pf_price, t_order.order_num, to_char(payment_done.pd_date, 'yyyy.MM.dd'), money.pay_money, to_char(profits.pf_date, 'yyyy.MM.dd') pf_date  " + 
					"from (select t_seq from talent where m_email= ? ) talent join payment_list on payment_list.t_seq=talent.t_seq " + 
					"join t_order on t_order.p_seq = payment_list.p_seq join profits on profits.order_num = t_order.order_num " + 
					"join payment_done on payment_done.p_seq = t_order.p_seq " + 
					"join (select payment.p_seq p_seq, nvl2(cash_use.cu_deduction, payment.p_price + cash_use.cu_deduction, payment.p_price) pay_money from payment left outer join cash_use on payment.p_seq = cash_use.p_seq ) money on money.p_seq = t_order.p_seq " + 
					"where pf_sep like '%출금가능%')) " + 
					"pivot ( sum(pf_price) for pf_date in ( "+dateset+" ) )";
					
			pstmt=conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			
			JSONArray done = new JSONArray();	

			while (rs.next()) {
				
				for (int i = 1; i <= datearr.size(); i++) {
					done.add(rs.getInt(i));
				}
			}
			
			jobj.put("done", done);
			System.out.println(done);

			request.setAttribute("data", jobj);
			
			
		}


		
		return "/WEB-INF/view/sell/vacation.jsp";
	}
}
