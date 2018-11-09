package sell;

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
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class AdverHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Date date = new Date();
		Date date2 = new Date(date.getYear()-1, date.getMonth(), date.getDate());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = df.format(date);
		String strDate2 = df.format(date2);
	
		String start_date =  request.getParameter("start_date")==null? strDate2 : request.getParameter("start_date");
		String end_date =  request.getParameter("end_date")==null? strDate : request.getParameter("end_date");	

		request.setAttribute("start_date", start_date);
		request.setAttribute("end_date", end_date);
			
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn=DBConn.getConnection();
		
		String id = "dodo95123@naver.com"; // 세션 받아와서 저장
		String name = "soomin1";
		String state = request.getParameter("state")== null ? "전체" : request.getParameter("state");

		String query = "select nvl2(sum(pf_price), sum(pf_price), 0) from ( " + 
				"select distinct g_profits.pf_seq, profits.pf_sep, profits.pf_price, t_order.order_num, payment_done.pd_date, money.pay_money, g_profits.pf_date " + 
				"from (select t_seq from talent where m_email= ? ) talent join payment_list on payment_list.t_seq=talent.t_seq " + 
				"join t_order on t_order.p_seq = payment_list.p_seq join profits on profits.order_num = t_order.order_num " + 
				"join (select order_num, max(pf_date) pf_date, max(pf_seq) pf_seq from profits group by order_num) g_profits on profits.pf_date=g_profits.pf_date and profits.pf_seq=g_profits.pf_seq " + 
				"join payment_done on payment_done.p_seq = t_order.p_seq " + 
				"join (select payment.p_seq p_seq, nvl2(cash_use.cu_deduction, payment.p_price + cash_use.cu_deduction, payment.p_price) pay_money from payment left outer join cash_use on payment.p_seq = cash_use.p_seq ) money on money.p_seq = t_order.p_seq " + 
				"where pf_sep like '출금가능' or pf_sep like '출금신청' order by pf_date desc)";
		
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		
		int profit = 0;
		
		while (rs.next()) {
			profit = rs.getInt(1);
		}
		// 출금 가능 수익금
		request.setAttribute("profit", profit);
		
		int milege = 0;

		query = "select mm_money from master_milege where m_email=?";
		
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		while (rs.next()) {
			milege = rs.getInt(1);
		}
		// 마일리지
		request.setAttribute("milege", milege);

		
		
		query = "select m_sep from member where m_email=?";
		
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		String mem = null;
		
		while (rs.next()) {
			mem = rs.getString(1);
		}
		
		mem = mem.contains("판매") ? "sell" : "buy";
		// 전문가 여부
		request.setAttribute("mem", mem);
		
		query = "select profile_cnt(?) from dual";
		
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		
		rs=pstmt.executeQuery();
		
		int pro_rate = 0;
		
		while (rs.next()) {
			pro_rate = rs.getInt(1);
		}
		// 프로필 완성도
		request.setAttribute("pro_rate", pro_rate);
		// state 전체, 광고중, 광고완료
		request.setAttribute("state", state);
		request.setAttribute("name", name);
		request.setAttribute("active", "ad");
		
		query = "select count(p_seq) from ad_buy " + 
				"join talent on ad_buy.t_seq=talent.t_seq where talent.m_email=? and ad_start is not null " + 
				"and ad_start+(ad_term*7) >= sysdate";
		
		pstmt=conn.prepareStatement(query);
		pstmt.setString(1, id);
		
		rs=pstmt.executeQuery();
		
		int cnt = 0;
		
		while (rs.next()) {
			cnt = rs.getInt(1);
		}
		
		request.setAttribute("cnt", cnt);
		
		String subquery = state.contains("광고중")? " and ad_start + (ad_term*7) >= sysdate " : state.contains("광고완료")? " and ad_start + (ad_term*7) < sysdate " : "";
		
		
		query = "select p_seq, nvl2(t_ad, t_ad, ' '), t_name, ad_term, to_char(ad_start, 'yyyy.MM.dd'), to_char(ad_start + (ad_term*7), 'yyyy.MM.dd'), ad_sep from ad_buy " + 
				"join talent on ad_buy.t_seq=talent.t_seq where talent.m_email=? and ad_start is not null"
				+ subquery + " and ad_start >= ? and ad_start <= ?" ;
		
		
		pstmt=conn.prepareStatement(query);
		pstmt.setString(1, id);
		pstmt.setString(2, start_date);
		pstmt.setString(3, end_date);
		
		rs=pstmt.executeQuery();

		
		JSONObject jobj = new JSONObject();
		JSONArray jarr = new JSONArray();
		int p_seq;
		
		while (rs.next()) {
			
			JSONObject adobj = new JSONObject();
			
			p_seq = rs.getInt(1);
			adobj.put("t_ad", rs.getString(2));
			adobj.put("t_name", rs.getString(3));
			adobj.put("ad_term", rs.getInt(4));
			adobj.put("ad_start", rs.getString(5));
			adobj.put("ad_end", rs.getString(6));
			adobj.put("ad_sep", rs.getString(7));
			
			jarr.add(adobj);
		}
		
		jobj.put("adlist", jarr);
		
		request.setAttribute("ad", jobj);
		
		
		
		
		
		return "/WEB-INF/view/sell/ad_body.jsp";	}

}
