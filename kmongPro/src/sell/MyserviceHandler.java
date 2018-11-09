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

public class MyserviceHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("myservicehandler");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Date now = new Date();
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		
		JSONArray datearr = new JSONArray();
		
		datearr.add(df.format(new Date(now.getYear(), now.getMonth(), now.getDate()+1)));
		datearr.add(df.format(new Date(now.getYear(), now.getMonth(), now.getDate()+2)));
		datearr.add(df.format(new Date(now.getYear(), now.getMonth(), now.getDate()+3)));
		datearr.add(df.format(new Date(now.getYear(), now.getMonth(), now.getDate()+4)));
		datearr.add(df.format(new Date(now.getYear(), now.getMonth(), now.getDate()+5)));
		datearr.add(df.format(new Date(now.getYear(), now.getMonth(), now.getDate()+6)));
		datearr.add(df.format(new Date(now.getYear(), now.getMonth(), now.getDate()+7)));
		datearr.add(df.format(new Date(now.getYear(), now.getMonth(), now.getDate()+14)));
		datearr.add(df.format(new Date(now.getYear(), now.getMonth(), now.getDate()+21)));
		datearr.add(df.format(new Date(now.getYear(), now.getMonth(), now.getDate()+30)));
		
		request.setAttribute("datearr", datearr);
		
		JSONObject jobj = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		conn=DBConn.getConnection();
		
		String id = "nyj0602@naver.com"; // 세션 받아와서 저장
		String name = "soomin1";
		String state = request.getParameter("state")==null? "" : request.getParameter("state");
		state = state.contains("전체") ? "" : state;
		
		
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
		request.setAttribute("active", "msv");
		request.setAttribute("state",state);
		
		
		// 개수 카운트
		query = "select serv_count(?, '%'), serv_count(?, '%판매중'), serv_count(?, '%승인대기중'), serv_count(?, '%판매중지'), serv_count(?, '%비승인') from dual";
		
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		pstmt.setString(2, id);
		pstmt.setString(3, id);
		pstmt.setString(4, id);
		pstmt.setString(5, id);
		
		
		rs=pstmt.executeQuery();
		
		JSONArray cntarry = new JSONArray();
		
		while (rs.next()) {
			cntarry.add(rs.getInt(1));
			cntarry.add(rs.getInt(2));
			cntarry.add(rs.getInt(3));
			cntarry.add(rs.getInt(4));
			cntarry.add(rs.getInt(5));
			
		}
		
		request.setAttribute("servcnt", cntarry);
		
		query = "select member.m_email, nvl2(v_state, v_state, '비휴가')  from member left outer join vac_state on vac_state.M_EMAIL = MEMBER.M_EMAIL where member.m_email=?";
		
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		
		rs=pstmt.executeQuery();
		
		String v_state = "";
		
		while (rs.next()) {
			v_state=rs.getString(2);
		}
		
		request.setAttribute("v_state", v_state);
		
		query = "select distinct ts_name, talent.t_seq, t_name, image.image, nvl2(sell_cnt, sell_cnt, 0), op_price, cate.대분류, cate.중분류, cate.소분류 " + 
				"from talent " + 
				"left outer join tal_state on tal_state.t_seq = talent.t_seq " + 
				"left outer join image on image.t_seq = talent.t_seq " + 
				"join (select t_seq, min(i_seq) i_seq from image group by t_seq) g_image on g_image.i_seq=image.i_seq " + 
				"left outer join payment_list on payment_list.t_seq=talent.t_seq " + 
				"left outer join (select t_seq, count(distinct t_order.order_num) sell_cnt from completed join t_order on t_order.order_num = completed.order_num join payment_list on payment_list.p_seq = t_order.p_seq group by t_seq) completed on completed.t_seq = payment_list.t_seq " + 
				"join t_option on t_option.t_seq = talent.t_seq " + 
				"join (select distinct cat.t_seq, category.c_group 대분류, cat.c_group 중분류, nvl2(car.c_group, car.c_group, ' ' ) 소분류 " + 
				"from (select talent.t_seq, cat_arrange.c_id c_id,c_group, c_superid from category join cat_arrange on cat_arrange.c_id = category.c_id join talent on talent.t_seq = cat_arrange.t_seq) cat " + 
				"join category on category.c_id=cat.c_superid " + 
				"left outer join (select cat_arrange.t_seq, cat_arrange.c_id,c_group, c_superid from category join cat_arrange on cat_arrange.c_id = category.c_id join talent on talent.t_seq = cat_arrange.t_seq where category.c_level = 3) car on car.c_superid = cat.c_id and cat.t_seq=car.t_seq " + 
				"where category.c_level <=1) cate on cate.t_seq = talent.t_seq " + 
				"where m_email=? and t_option.op_seq = 1 and ts_name like '%"+state+"' and ts_name != '삭제'";
		
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		
		rs=pstmt.executeQuery();
		
		while (rs.next()) {
			JSONObject msvobj = new JSONObject();
			msvobj.put("ts_name", rs.getString(1));
			msvobj.put("t_seq", rs.getInt(2));
			msvobj.put("t_name", rs.getString(3));
			msvobj.put("image", rs.getString(4));
			msvobj.put("sellcnt", rs.getInt(5));
			msvobj.put("op_price", rs.getInt(6));
			msvobj.put("cate", rs.getString(7));
			msvobj.put("subcate", rs.getString(8));
			msvobj.put("opcate", rs.getString(9));
			
			jarr.add(msvobj);
		}
		
		jobj.put("myservice", jarr);
		
		request.setAttribute("myserv", jobj);
		
		System.out.println("myservicehandler end");
		
		return "/WEB-INF/view/sell/myservice_body.jsp";
	}

}
