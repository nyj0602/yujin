package command;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PagingDAO {

	private static PagingDAO dao = null;
	
	private PagingDAO() {}
	
	public static PagingDAO getInstance() {
		if (dao == null) {
			dao=new PagingDAO();
		}
		return dao;
	}
	
	public String pagingProc(int currentPage, int pageSize, int pageBlock, int totalPages, String req) {

		int blockStart, blockEnd;
		blockStart = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		blockEnd = blockStart + pageBlock - 1 > totalPages ? totalPages : blockStart + pageBlock - 1;
		String pblock = "<div style='width:100%;text-align:center'>";
		// 1. previous |< <
		if (blockStart > 1) {
			pblock += String.format("<a class='plain' href='"+req+".do?page=%d'>&nbsp;≤&nbsp;</a> ", 1);
			pblock += String.format("<a class='plain' href='"+req+".do?page=%d'>＜&nbsp;</a> ", blockStart - 1);
		}

		// 2.
		for (int i = blockStart; i <= blockEnd; i++) {
			if (currentPage == i) {
				pblock += "<span id='curSpan' style='color:darkgreen'>" + i + "</span>&nbsp;";
			} else {
				pblock += String.format("<a class='plain' style='color:gray' href='"+req+".do?page=%d'>%d</a> ", i, i);
			}
		}

		// 3. next > >|
		if (blockEnd < totalPages) {
			pblock += String.format("<a class='plain' href='"+req+".do?page=%d'>&nbsp;>&nbsp;</a> ", blockEnd + 1);

			pblock += String.format("<a class='plain' href='"+req+".do?page=%d'>≥&nbsp;</a> ", totalPages);

		}
		pblock += "</div>";

		return pblock;
	}
	
	
	public int getTotalCashRecords(Connection conn, String type, String profile, String id, String start_date, String end_date ) {
		
		int cnt = 0;
		String query ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		if(type.equals("적립") && profile.equals("false")) {
			query = "select count(cl_seq) from cash_list where m_email = ? and (cl_sep like '%"+type+"%' or cl_sep like '충전') and cl_date >= ? and cl_date <= ? order by cl_seq desc";
		}
		else {
			query = "select count(cl_seq) from cash_list where m_email = ? and cl_sep like '%"+type+"%' and cl_date >= ? and cl_date <= ? order by cl_seq desc";
		}
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, start_date);
			pstmt.setString(3, end_date);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cnt=rs.getInt(1);
			}
			
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return cnt;
	}
	
	public int getTotalPayRecords(Connection conn, String type, String id, String start_date, String end_date ) {
		
		int cnt = 0;
		String query ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		if(type.contains("환불")) {
			query = "select count(payment.p_seq) "
			+"from payment join payment_done on payment.p_seq = payment_done.p_seq "
			+"join (select p_seq, max(ps_date) ps_date, max(ps_state) ps_state from payment_state group by p_seq) payment_state on payment_state.p_seq=payment_done.p_seq "
			+"where payment.m_email=? and payment_state.ps_state like '%"+type+"%' and ps_date >= ? and ps_date <= ? order by payment.p_seq";
			
		} else {
			query = "select count(payment.p_seq) "
			+"from payment join payment_done on payment.p_seq = payment_done.p_seq "
			+"join (select p_seq, max(ps_date) ps_date, max(ps_state) ps_state from payment_state group by p_seq) payment_state on payment_state.p_seq=payment_done.p_seq "
			+"where payment.m_email=? and payment_state.ps_state like '%"+type+"%' and pd_date >= ? and pd_date <= ? order by payment.p_seq";
			
		}
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, start_date);
			pstmt.setString(3, end_date);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cnt=rs.getInt(1);
			}
			
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return cnt;
	}
	
	public JSONObject selectCashList(Connection conn, int start, int end, String type, String profile, String id, String start_date, String end_date ) {

		JSONObject jobj = new JSONObject();
		JSONArray jarr = new JSONArray();
		

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		String query ;
		
		if(type.equals("적립") && profile.equals("false")) {
			query = "select * from (select rownum rnum, cl_seq, cl_sep, to_char(cl_date, 'yyyy.mm.dd'), cl_state, cl_price, p_seq from cash_list where m_email = ? and (cl_sep like '%"+type+"%' or cl_sep like '충전') and cl_date >= ? and cl_date <= ? order by cl_seq desc) where rnum between ? and ?";
			
		}
		else {
			query = "select * from (select rownum rnum, cl_seq, cl_sep, to_char(cl_date, 'yyyy.mm.dd'), cl_state, cl_price, p_seq from cash_list where m_email = ? and cl_sep like '%"+type+"%' and cl_date >= ? and cl_date <= ? order by cl_seq desc) where rnum between ? and ?";
			
		}
		
		try {	

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, start_date);
			pstmt.setString(3, end_date);
			pstmt.setInt(4, start);
			pstmt.setInt(5, end);
			rs = pstmt.executeQuery();
			
			String cl_sep = null;
			int cl_seq = 0;
			int p_seq = 0;
				
				while(rs.next()) {
					
					JSONObject cashobj = new JSONObject();
					
					cashobj.put("rnum", rs.getInt(1));
					cl_seq = rs.getInt(2);
					cashobj.put("cl_seq", cl_seq);
					cl_sep = rs.getString(3);
					cashobj.put("cl_sep", cl_sep);
					cashobj.put("cl_date", rs.getString(4));
					cashobj.put("cl_state", rs.getString(5));
					cashobj.put("cl_price", rs.getInt(6));
					p_seq = rs.getInt(7);
					
					
					if(cl_sep.contains("적립")) {
						
						query = "select to_char(cl_date+(INTERVAL '1' YEAR),'yyyy.mm.dd') from cash_list where cl_seq = ?";
						pstmt=conn.prepareStatement(query);
						
						pstmt.setInt(1, cl_seq);
						
						rs2=pstmt.executeQuery();
						
						while(rs2.next()) {
							cashobj.put("etc", "만료예정일:"+rs2.getString(1));
						}
						
								
					} else if (cl_sep.contains("사용")) {
						
						query = "select distinct order_num, t_name from cash_list cl join payment_list pl on pl.p_seq = cl.p_seq join talent t on t.t_seq = pl.t_seq join t_order o on o.p_seq = cl.p_seq where cl_sep='사용' and cl.m_email=? and cl.p_seq=?";
						pstmt=conn.prepareStatement(query);
						
						pstmt.setString(1, id);
						pstmt.setInt(2, p_seq);
						
						rs2=pstmt.executeQuery();
						
						while (rs2.next()) {
							cashobj.put("etc", "(#"+rs2.getInt(1)+")"+rs2.getString(2));
						}
						
					} 
					else {
						cashobj.put("etc", "");
					}
					jarr.add(cashobj);
				}
				
				jobj.put("cash", jarr);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}

		return jobj;
	
	}

	
	
	public JSONObject selectPayList(Connection conn, int start, int end, String type, String id, String start_date, String end_date) {

		JSONObject jobj = new JSONObject();
		JSONArray jarr = new JSONArray();
				

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		String query ;
		
		if(type.contains("환불")) {
			query = "select * from (select rownum rnum, to_char(payment_done.pd_date, 'yyyy.mm.dd') pd_date, payment.p_sep, payment.p_how, payment.p_price, payment.p_seq, payment_state.ps_state, to_char(payment_state.ps_date, 'yyyy.mm.dd') ps_date "
			+"from payment join payment_done on payment.p_seq = payment_done.p_seq "
			+"join (select p_seq, max(ps_date) ps_date, max(ps_state) ps_state from payment_state group by p_seq) payment_state on payment_state.p_seq=payment_done.p_seq "
			+"where payment.m_email=? and payment_state.ps_state like '%"+type+"%' and ps_date >= ? and ps_date <= ? order by payment.p_seq) where rnum between ? and ? ";
			
		} else {
			query = "select * from (select rownum rnum, to_char(payment_done.pd_date, 'yyyy.mm.dd') pd_date, payment.p_sep, payment.p_how, payment.p_price, payment.p_seq, payment_state.ps_state, to_char(payment_state.ps_date, 'yyyy.mm.dd') "
			+"from payment join payment_done on payment.p_seq = payment_done.p_seq "
			+"join (select p_seq, max(ps_date) ps_date, max(ps_state) ps_state from payment_state group by p_seq) payment_state on payment_state.p_seq=payment_done.p_seq "
			+"where payment.m_email=? and payment_state.ps_state like '%"+type+"%' and pd_date >= ? and pd_date <= ? order by payment.p_seq) where rnum between ? and ? ";
			
		}
		
		try {	

			pstmt=conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, start_date);
			pstmt.setString(3, end_date);
			pstmt.setInt(4, start);
			pstmt.setInt(5, end);
			rs = pstmt.executeQuery();

			String ck = null;
			int p_seq = 0;
				
				while(rs.next()) {
						
						JSONObject payobj = new JSONObject();
									
						payobj.put("rnum", rs.getInt(1));
						payobj.put("pd_date", rs.getString(2));
						
						ck = rs.getString(3);
						payobj.put("p_sep",ck );
						
						payobj.put("p_how", rs.getString(4) );
						payobj.put("p_price", rs.getInt(5));
						
						p_seq=rs.getInt(6);
						payobj.put("p_seq", p_seq);
						payobj.put("ps_state", rs.getString(7));
						payobj.put("ps_date", rs.getString(8));
						
						if(ck.contains("서비스")) {

							
							pstmt=conn.prepareStatement("select distinct talent.t_seq, talent.t_name from talent join payment_list on talent.t_seq=payment_list.t_seq where payment_list.p_seq=?");
							pstmt.setInt(1, p_seq);
							
							rs2 = pstmt.executeQuery();
							
							String t_seq = null; 
							String t_name = null;
							
							while(rs2.next()) {
								
								t_seq = "(#"+rs2.getInt(1)+")";
								t_name = rs2.getString(2);
								
								payobj.put("t_seq",t_seq );
								payobj.put("t_name", t_name);
							}
									
						} else {
							payobj.put("t_seq", " ");
							payobj.put("t_name", " ");
						}
						
						
						jarr.add(payobj);
					
					}
					
					jobj.put("pay", jarr);
			}
			catch (SQLException e) {
				e.printStackTrace();
			}

		return jobj;
	
	}	
	
	
	
	
}

	

