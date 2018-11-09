package sell;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ProfitsmanageHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		conn=DBConn.getConnection();
		
		String id = "nyj0602@naver.com"; // 세션 받아와서 저장
		String name = "soomin1";
		String type = request.getParameter("type")== null ? "전체" : request.getParameter("type");
		String tab = request.getParameter("tab")==null? "profits" : request.getParameter("tab");
		
		String subquery;
		
		if (tab.contains("profits")) {
			subquery = type.contains("전체") ? "where pf_sep like '%출금가능%' or pf_sep like '출금신청' or pf_sep like '예상' or pf_sep like '취소'" : type.contains("진행중") ? "where pf_sep like '예상'" : type.contains("완료") ? "where pf_sep like '%출금가능%' or pf_sep like '출금신청' " : "where pf_sep like '취소'";			
		} else {
			subquery =  "where pf_sep like '%출금%완료%'";
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
		
		query = "select nvl2(pm_name, pm_name, cm_name) name, nvl2(ps_count, ps_count, cs_count) count, nvl2(per_member.b_name, per_member.b_name, com_member.b_name) b_name from member " + 
				"left outer join (select per_member.m_email, per_member.pm_name, per_seller.ps_count, bank.b_name from per_member join per_seller on per_seller.m_email=per_member.m_email join bank on bank.b_seq = per_seller.b_seq ) per_member on per_member.m_email = member.m_email " +
				"left outer join (select com_member.m_email, com_member.cm_name, com_seller.cs_count, bank.b_name from com_member join com_seller on com_seller.m_email=com_member.m_email join bank on bank.b_seq = com_seller.b_seq) com_member on com_member.m_email=member.m_email " + 
				"where member.m_sep like '%판매%' and member.m_email= ? ";
		
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();	
		
		
		while (rs.next()) {
			JSONObject countobj = new JSONObject();
			countobj.put("c_name", rs.getString(1));
			countobj.put("c_count", rs.getString(2));
			countobj.put("c_bank", rs.getString(3));
			request.setAttribute("count", countobj);
		}
		
		
		query = "select ex_profits( ?, '%출금%완료%'), ex_profits( ?, '%예상%') from dual";
		
		pstmt=conn.prepareStatement(query);
		pstmt.setString(1, id);
		pstmt.setString(2, id);
		
		rs=pstmt.executeQuery();
		
		while (rs.next()) {
			JSONObject moneyobj = new JSONObject();
			moneyobj.put("com_moeny", rs.getInt(1));
			moneyobj.put("ex_money", rs.getInt(2));
			
			request.setAttribute("mymoney", moneyobj);
		}
		
		// 출금신청이 있는지 없는지 확인
		query = "select nvl2(cr_date, 'is', 'non') from ( " + 
				"select * from cash_refund where m_email=? and cr_sep like '%수익금%'  order by cr_seq) where rownum = 1";
		
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		String ck = "";
		
		while (rs.next()) {
			ck=rs.getString(1);
		}
		
		String display = null;
		
		if(ck.contains("non")) {
			display = "wait";
		};
		
		request.setAttribute("with", display);
		
		JSONObject jobj = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		
		query = "select distinct profits.pf_sep, profits.pf_price, t_order.order_num, to_char(payment_done.pd_date, 'yyyy.MM.dd'), money.pay_money, to_char(profits.pf_date, 'yyyy.MM.dd') pf_date " + 
				"from (select t_seq from talent where m_email= ? ) talent join payment_list on payment_list.t_seq=talent.t_seq " + 
				"join t_order on t_order.p_seq = payment_list.p_seq join profits on profits.order_num = t_order.order_num " + 
				"join (select order_num, max(pf_date) pf_date from profits group by order_num) g_profits on profits.pf_date=g_profits.pf_date and profits.order_num=g_profits.order_num " + 
				"join payment_done on payment_done.p_seq = t_order.p_seq " + 
				"join (select payment.p_seq p_seq, nvl2(cash_use.cu_deduction, payment.p_price + cash_use.cu_deduction, payment.p_price) pay_money from payment left outer join cash_use on payment.p_seq = cash_use.p_seq ) money on money.p_seq = t_order.p_seq " + 
				subquery + " order by pf_date desc ";
		
		
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		
		String pf_date;
		
		while (rs.next()) {
			JSONObject profitobj = new JSONObject();
			profitobj.put("pf_sep", rs.getString(1));
			profitobj.put("pf_price", rs.getInt(2));
			profitobj.put("order_num", rs.getInt(3));
			profitobj.put("pd_date", rs.getString(4));
			profitobj.put("pay_money", rs.getInt(5));
			pf_date = rs.getString(6);
			
			jarr.add(profitobj);
			
		}
		
		jobj.put("profitlist", jarr);
		
		// 수익관리 내역
		request.setAttribute("profits", jobj);
		
		
		request.setAttribute("name", name);
		request.setAttribute("active", "bene");
		request.setAttribute("type", type);
		request.setAttribute("tab", tab);
		
		
		return "/WEB-INF/view/sell/profit_body.jsp";
	}

}
