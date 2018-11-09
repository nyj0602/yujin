package buy;

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

public class BuymanageHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("buyprofileHandler");
		
		Date date = new Date();
		Date date2 = new Date(date.getYear()-1, date.getMonth(), date.getDate());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = df.format(date);
		String strDate2 = df.format(date2);
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		JSONObject jobj = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		conn=DBConn.getConnection();
		
		String id = "dodo95123@naver.com"; // 세션 받아와서 저장
		String name = "soomin1";
		String state = request.getParameter("state")==null? "진행" : request.getParameter("state");
		
	
		String start_date =  request.getParameter("start_date")==null? strDate2 : request.getParameter("start_date");
		String end_date =  request.getParameter("end_date")==null? strDate : request.getParameter("end_date");
		
		String keyword = request.getParameter("keyword")==null? "" : request.getParameter("keyword");
		
		String query = "select s.sc_money, c.cc_money from save_cash s join charge_cash c on s.m_email=c.m_email where s.m_email=? and c.m_email=?"; 
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		pstmt.setString(2, id);
				
		rs = pstmt.executeQuery();
		
		
		int sc=0, cc=0;
		while(rs.next()) {
			
			sc = rs.getInt(1);
			cc = rs.getInt(2);
		}


		request.setAttribute("sc", sc);
		request.setAttribute("cc", cc);
		
		
		if (!state.contains("평가")){
		
			query = "select distinct s.order_num, img.IMAGE ,pl.t_seq, tal.t_name, m.m_name ,t.op_price from (select * from payment where m_email=?) f join "+
			"(select t_order.p_seq, t_order.order_num, payment_done.pd_date from t_order join payment_done on t_order.p_seq = payment_done.p_seq where payment_done.pd_date >= ? and PAYMENT_DONE.PD_DATE <= ? )"
			+" s on f.p_seq = s.p_seq join progress p on s.order_num = p.order_num join payment_list pl on s.p_seq = pl.p_seq join (select * from t_option where op_sep='standard') t on t.t_seq=pl.t_seq join talent tal on t.t_seq = tal.t_seq join (select t_seq, min(i_seq) i_seq from image group by t_seq) mi on mi.t_seq=pl.t_seq join image img on img.i_seq=mi.i_seq join member m on tal.m_email=m.m_email where p_state like '%"+state+"%' and tal.t_name like '%"+keyword+"%'";

		} else {
			
			query = "select distinct s.order_num, img.image ,pl.t_seq, tal.t_name, m.m_name ,t.op_price"
					+" from (select * from payment where m_email=?) f "
					+" join (select t_order.p_seq, t_order.order_num, payment_done.pd_date from t_order join payment_done on t_order.p_seq = payment_done.p_seq where payment_done.pd_date >= ? and PAYMENT_DONE.PD_DATE <= ? ) s on f.p_seq = s.p_seq "
					+" join progress p on s.order_num = p.order_num "
					+" join payment_list pl on s.p_seq = pl.p_seq "
					+" join (select * from t_option where op_sep='standard') t on t.t_seq=pl.t_seq "
					+" join talent tal on t.t_seq = tal.t_seq "
					+" join (select t_seq, min(i_seq) i_seq from image group by t_seq) mi on mi.t_seq=pl.t_seq "
					+" join image img on img.i_seq=mi.i_seq "
					+" join member m on tal.m_email=m.m_email "
					+" join completed c on c.order_num=s.order_num"
					+" where p_state like '%완료%' and tal.t_name like '%"+keyword+"%'"
					+" minus"
					+" select distinct s.order_num, img.image ,pl.t_seq, tal.t_name, m.m_name ,t.op_price"
					+" from (select * from payment where m_email=?) f "
					+" join (select t_order.p_seq, t_order.order_num, payment_done.pd_date from t_order join payment_done on t_order.p_seq = payment_done.p_seq where payment_done.pd_date >= ? and PAYMENT_DONE.PD_DATE <= ? ) s on f.p_seq = s.p_seq "
					+" join progress p on s.order_num = p.order_num "
					+" join payment_list pl on s.p_seq = pl.p_seq "
					+" join (select * from t_option where op_sep='standard') t on t.t_seq=pl.t_seq "
					+" join talent tal on t.t_seq = tal.t_seq "
					+" join (select t_seq, min(i_seq) i_seq from image group by t_seq) mi on mi.t_seq=pl.t_seq "
					+" join image img on img.i_seq=mi.i_seq "
					+" join member m on tal.m_email=m.m_email "
					+" join evaluation e on e.order_num = s.order_num "
					+" where p_state like '%완료%' and tal.t_name like '%"+keyword+"%'";
			
		}
		
		
		pstmt=conn.prepareStatement(query);
		
		if (!state.contains("평가")) {
			pstmt.setString(1, id);
			pstmt.setString(2, start_date);
			pstmt.setString(3, end_date);
		}
		else {
			pstmt.setString(1, id);
			pstmt.setString(2, start_date);
			pstmt.setString(3, end_date);		
			pstmt.setString(4, id);
			pstmt.setString(5, start_date);
			pstmt.setString(6, end_date);	
		}
		rs=pstmt.executeQuery();

		
		while(rs.next()) {
			
			JSONObject talobj = new JSONObject();
			talobj.put("order_num", rs.getInt(1));
			talobj.put("image", rs.getString(2));
			talobj.put("t_seq", rs.getInt(3));
			talobj.put("t_name", rs.getString(4));
			talobj.put("m_name", rs.getString(5));
			talobj.put("op_price", rs.getInt(6));

			jarr.add(talobj);
			
		}
		
		jobj.put("tal", jarr);
		
		request.setAttribute("talent", jobj);
		request.setAttribute("name", name);
		
		
		query = "select tal_count(?, '%요청%'), tal_count(?, '%진행%'), tal_count(?, '%발송%'), tal_count(?, '%완료%'), tal_count(?, '%평가%'), tal_count(?, '%취소%') from dual";
		
		JSONArray count = new JSONArray();

		
		pstmt=conn.prepareStatement(query);
		
		pstmt.setString(1, id);
		pstmt.setString(2, id);
		pstmt.setString(3, id);
		pstmt.setString(4, id);
		pstmt.setString(5, id);
		pstmt.setString(6, id);
		
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			
			count.add(rs.getInt(1));
			count.add(rs.getInt(2));
			count.add(rs.getInt(3));
			count.add(rs.getInt(4));
			count.add(rs.getInt(5));
			count.add(rs.getInt(6));
						
		}
		
		request.setAttribute("count", count);
		request.setAttribute("state",state);
		request.setAttribute("start_date",start_date);
		request.setAttribute("end_date",end_date);
		request.setAttribute("keyword", keyword);
		request.setAttribute("active", "buy");
		request.setAttribute("start_date", start_date);
		request.setAttribute("end_date", end_date);
		
		return "/WEB-INF/view/buy/buy_body.jsp";
		
	}

}
