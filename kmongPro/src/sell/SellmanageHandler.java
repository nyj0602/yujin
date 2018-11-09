package sell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class SellmanageHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("sellmanageHandler");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		JSONObject jobj = new JSONObject();
		JSONArray jarr = new JSONArray();
		JSONArray jarr2 = new JSONArray();
		
		conn=DBConn.getConnection();
		
		String id = "nyj0602@naver.com"; // 세션 받아와서 저장
		String name = "soomin1";
		
		String state = request.getParameter("state")==null? "진행" : request.getParameter("state");
		String keyword = request.getParameter("keyword")==null? "" : request.getParameter("keyword");
	
		String [] gig = request.getParameterValues("gigs") == null ? null : request.getParameterValues("gigs");
		
		request.setAttribute("gig", gig);
		
		String array = "";
		String subquery = "";
		int [] gigs ; 
		
		
		if (gig!=null) {
			
			gigs = new int[gig.length];
			
			for (int i = 0; i < gig.length; i++) {
				gigs[i] = Integer.parseInt(gig[i]);
				array += gigs[i];
				array += i==gig.length-1? "" : ",";
			}
			
			subquery = " and talent.t_seq in ("+array+")";
		}
		
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
		
		
		request.setAttribute("name", name);
		request.setAttribute("profit", profit);
		request.setAttribute("milege", milege);
		request.setAttribute("active", "sell");
		request.setAttribute("state",state);
		request.setAttribute("keyword", keyword);
		
		
		query = "select sell_cnt('%요청%', ?), sell_cnt('%진행%', ?), sell_cnt('%발송%', ?), sell_cnt('%늦은%', ?), sell_cnt('%완료%', ?), sell_cnt('%취소%', ?) from dual";
		
		pstmt=conn.prepareStatement(query);
		
		JSONArray count = new JSONArray();

		pstmt.setString(1, id);
		pstmt.setString(2, id);
		pstmt.setString(3, id);
		pstmt.setString(4, id);
		pstmt.setString(5, id);
		pstmt.setString(6, id);
		
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			count.add(rs.getInt(1));
			count.add(rs.getInt(2));
			count.add(rs.getInt(3));
			count.add(rs.getInt(4));
			count.add(rs.getInt(5));
			count.add(rs.getInt(6));
		}
		
		request.setAttribute("count", count);
		
		query = "select t_seq, t_name from talent where m_email=?";
		
		pstmt=conn.prepareStatement(query);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		while (rs.next()) {
			JSONObject myservice = new JSONObject();
			myservice.put("t_seq", rs.getInt(1));
			myservice.put("t_name", rs.getString(2));
			
			jarr2.add(myservice);
		}
		
		jobj.put("service", jarr2);
		
		
		if (state.contains("늦은")) {
			state="발송";
			query = "select progress.order_num, t_order.p_seq, talent.t_name, member.m_name, member.m_profile, profits.pf_price from progress join t_order on t_order.order_num=progress.order_num join payment on payment.p_seq = t_order.p_seq join (select t_seq, min(p_seq) p_seq from payment_list group by t_seq) payment_list on payment_list.p_seq = payment.p_seq join talent on talent.t_seq = payment_list.t_seq join member on member.m_email=payment.m_email join (select m_email from member where m_sep like '%판매%') sellmem on sellmem.m_email=talent.m_email join (select order_num, sum(pf_price) pf_price from profits where pf_sep like '%예상%' and order_num=1 group by order_num, pf_sep) profits on profits.order_num=progress.order_num where progress.p_state like '%"+state+"%' and sellmem.m_email=? and member.m_name like '%"+keyword+"%' and progress.deadline < sysdate";
		} else if (state.contains("발송")) {
			query = "select progress.order_num, t_order.p_seq, talent.t_name, member.m_name, member.m_profile, profits.pf_price from progress join t_order on t_order.order_num=progress.order_num join payment on payment.p_seq = t_order.p_seq join (select t_seq, min(p_seq) p_seq from payment_list group by t_seq) payment_list on payment_list.p_seq = payment.p_seq join talent on talent.t_seq = payment_list.t_seq join member on member.m_email=payment.m_email join (select m_email from member where m_sep like '%판매%') sellmem on sellmem.m_email=talent.m_email join (select order_num, sum(pf_price) pf_price from profits where pf_sep like '%예상%' and order_num=1 group by order_num, pf_sep) profits on profits.order_num=progress.order_num where progress.p_state like '%"+state+"%' and sellmem.m_email=? and member.m_name like '%"+keyword+"%' and progress.deadline > sysdate";
		} else {
			query = "select progress.order_num, t_order.p_seq, talent.t_name, member.m_name, member.m_profile, profits.pf_price from progress join t_order on t_order.order_num=progress.order_num join payment on payment.p_seq = t_order.p_seq join (select t_seq, min(p_seq) p_seq from payment_list group by t_seq) payment_list on payment_list.p_seq = payment.p_seq join talent on talent.t_seq = payment_list.t_seq join member on member.m_email=payment.m_email join (select m_email from member where m_sep like '%판매%') sellmem on sellmem.m_email=talent.m_email join (select order_num, sum(pf_price) pf_price from profits where pf_sep like '%예상%' and order_num=1 group by order_num, pf_sep) profits on profits.order_num=progress.order_num where progress.p_state like '%"+state+"%' and sellmem.m_email=? and member.m_name like '%"+keyword+"%'"+ subquery;	
		}
				
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		
		rs=pstmt.executeQuery();
		
		int order_num = 0;
		
		while (rs.next()) {
			
			JSONObject talobj = new JSONObject();
			order_num = rs.getInt(1);
			talobj.put("order_num", order_num);
			talobj.put("p_seq", rs.getInt(2));
			talobj.put("t_name", rs.getString(3));
			talobj.put("m_name", rs.getString(4));
			talobj.put("m_profile", rs.getString(5));
			talobj.put("pf_price", rs.getInt(6));
			
			
			if(state.contains("완료")) {
				
				pstmt=conn.prepareStatement("select to_char(c_date, 'yyyy.MM.dd') from completed where order_num=?");
				pstmt.setInt(1, order_num);
				
				rs2=pstmt.executeQuery();
				
				while (rs2.next()) {
					talobj.put("date", rs2.getString(1));
				}
			}
			else if (state.contains("취소")) {
				pstmt=conn.prepareStatement("select to_char(r_req, 'yyyy.MM.dd') from refund where order_num=?");
				pstmt.setInt(1, order_num);
				
				rs2=pstmt.executeQuery();
				
				while (rs2.next()) {
					talobj.put("date", rs2.getString(1));
				}
				
			} else {
				
				pstmt=conn.prepareStatement("select to_char(pd_date, 'yyyy.MM.dd') from payment_done join t_order on t_order.order_nem=payment_done.order_num where order_num=?");
				pstmt.setInt(1, order_num);
				
				rs2=pstmt.executeQuery();
				
				while (rs2.next()) {
					talobj.put("date", rs2.getString(1));
				}
			}
			
			jarr.add(talobj);
			
		}
		
		jobj.put("tal", jarr);
		
		request.setAttribute("talent", jobj);
		
		
		return "/WEB-INF/view/sell/sellmanage_body.jsp";
	}

}
