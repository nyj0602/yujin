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

public class MastermilegeHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Date date = new Date();
		Date date2 = new Date(date.getYear()-1, date.getMonth(), date.getDate());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = df.format(date);
		String strDate2 = df.format(date2);
				
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		conn=DBConn.getConnection();
		
		String id = "nyj0602@naver.com"; // 세션 받아와서 저장
		String name = "soomin1";
		
		String start_date =  request.getParameter("start_date")==null? strDate2 : request.getParameter("start_date");
		String end_date =  request.getParameter("end_date")==null? strDate : request.getParameter("end_date");	
		String type = request.getParameter("type")== null ? "" : request.getParameter("type");

		
		type = type.equals("전체") ?  "" : type;

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
		

		
		query="select ex_mile( ? ) from dual";
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		int refund =0;
		try{
		while(rs.next()) {
			refund = rs.getInt(1);
		}
		}catch(NullPointerException e){
			refund = 0;
		}

		request.setAttribute("refund", refund);
		
		
		query = "select ml_seq, ml_sep, to_char(ml_date, 'yyyy.MM.dd'), ml_state, ml_price from milege_list where m_email=? and ml_sep like '%"+type+"%' and ml_date >= ? and ml_date <= ?  order by ml_date desc";
		
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		pstmt.setString(2, start_date);
		pstmt.setString(3, end_date);
		
		rs=pstmt.executeQuery();
		
		
		JSONObject jobj = new JSONObject();
		JSONArray jarr = new JSONArray();

		
		int ml_seq = 0;
		String ml_state;
		
		while (rs.next()) {
			
			JSONObject mileobj = new JSONObject();
			
			ml_seq = rs.getInt(1);
			mileobj.put("ml_sep", rs.getString(2));
			mileobj.put("ml_date", rs.getString(3));
			ml_state = rs.getString(4);
			mileobj.put("ml_state", ml_state);
			mileobj.put("ml_price", rs.getInt(5));
			
			if(ml_state.contains("판매완료")) {
				
				query = "select order_num from (select ml_seq, ml_code from milege_list where ml_seq = ?) milege_list join t_order on milege_list.ml_code = t_order.p_seq";
				pstmt=conn.prepareStatement(query);
				
				pstmt.setInt(1, ml_seq);
				
				rs2=pstmt.executeQuery();
				
				String order_num;
				
				while (rs2.next()) {
					
					order_num = "(#" + rs2.getInt(1) + ")";
					mileobj.put("order_num", order_num );
				}
							
			}
			else mileobj.put("order_num", "");
			
			jarr.add(mileobj);
			
		}
		
		jobj.put("milege", jarr);
		
		request.setAttribute("milegelist", jobj);
		request.setAttribute("name", name);
		request.setAttribute("active", "mm");
		request.setAttribute("type", type);
		request.setAttribute("start_date", start_date);
		request.setAttribute("end_date", end_date);
	
		
		return "/WEB-INF/view/sell/milege_body.jsp";
	}

}
