package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class AdminPaging {

	private static AdminPaging dao = null;
	
	private AdminPaging() {}
	
	public static AdminPaging getInstance() {
		if(dao==null) {
			dao=new AdminPaging();
		}
		return dao;
	}

	// 멤버관리부분
	public String pagingMemProc(int currentPage, int pageSize, int pageBlock, int totalPages, String req, String keyword, String sep) {

		int blockStart, blockEnd;
		blockStart = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		blockEnd = blockStart + pageBlock - 1 > totalPages ? totalPages : blockStart + pageBlock - 1;
		String pblock = "<div style='width:100%;text-align:center'>";
		// 1. previous |< <
		if (blockStart > 1) {
			pblock += String.format("<a class='plain' href='"+req+".do?page=%d&keyword=%s&sep=%s'>&nbsp;≤&nbsp;</a> ", 1, keyword, sep);
			pblock += String.format("<a class='plain' href='"+req+".do?page=%d&keyword=%s&sep=%s'>＜&nbsp;</a> ", blockStart - 1, keyword, sep);
		}

		// 2.
		for (int i = blockStart; i <= blockEnd; i++) {
			if (currentPage == i) {
				pblock += "<span id='curSpan' style='color:darkgreen'>" + i + "</span>&nbsp;";
			} else {
				pblock += String.format("<a class='plain' style='color:gray' href='"+req+".do?page=%d&keyword=%s&sep=%s'>%d</a> ", i, keyword, sep, i);
			}
		}

		// 3. next > >|
		if (blockEnd < totalPages) {
			pblock += String.format("<a class='plain' href='"+req+".do?page=%d&keyword=%s&sep=%s'>&nbsp;>&nbsp;</a> ", blockEnd + 1, keyword, sep);

			pblock += String.format("<a class='plain' href='"+req+".do?page=%d&keyword=%s&sep=%s'>≥&nbsp;</a> ", totalPages, keyword, sep);

		}
		pblock += "</div>";

		return pblock;
	}
	
	// 멤버 갯수 가져오기 함수. 
		public int getTotalMemRecords(Connection conn, String keyword, String sep ) {
			
			
			String query ;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int cnt = 0;
			
			
			if(sep.contains("전체")) {
				query = "select count(*) from ( " + 
						"select m.m_email, m.m_name, m.m_sep, nvl2(p.pm_name, p.pm_name, c.cm_name), nvl2(p.pm_phone, p.pm_phone, c.cm_phone) " + 
						"from member m " + 
						"left outer join per_member p on p.m_email=m.m_email " + 
						"left outer join com_member c on c.m_email=m.m_email " + 
						"where m_wdraing=0 " + 
						")";
			}
			else if(sep.contains("분류")){
				query = "select count(*) from ( " + 
						"select m.m_email, m.m_name, m.m_sep, nvl2(p.pm_name, p.pm_name, c.cm_name), nvl2(p.pm_phone, p.pm_phone, c.cm_phone) " + 
						"from member m " + 
						"left outer join per_member p on p.m_email=m.m_email " + 
						"left outer join com_member c on c.m_email=m.m_email " + 
						"where m_sep like '%"+keyword+"%' and m_wdraing=0 " + 
						")";
			}
			else {
				query = "select count(*) from ( " + 
						"select m.m_email, m.m_name, m.m_sep, nvl2(p.pm_name, p.pm_name, c.cm_name), nvl2(p.pm_phone, p.pm_phone, c.cm_phone) " + 
						"from member m " + 
						"left outer join per_member p on p.m_email=m.m_email " + 
						"left outer join com_member c on c.m_email=m.m_email " + 
						"where m_name like '%"+keyword+"%' and m_wdraing=0 " + 
						")";	
				
			}
			try {
				pstmt = conn.prepareStatement(query);
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
				
					cnt=rs.getInt(1);
				
				}
				
			} catch (Exception ex) {
				
				System.out.println(ex.toString());
				
			}
			return cnt;
		}
		
		public JSONObject selectMemberList(Connection conn,int start, int end, String keyword, String sep ) {

			JSONObject jobj = new JSONObject();
			JSONArray jarr = new JSONArray();
			

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String query=null ;
			
			if(sep.contains("전체")) {
				query = "select * from (select rownum rnum, m.m_email, m.m_name, m.m_sep, nvl2(p.pm_name, p.pm_name, c.cm_name), nvl2(p.pm_phone, p.pm_phone, c.cm_phone) " + 
						"from member m " + 
						"left outer join per_member p on p.m_email=m.m_email " + 
						"left outer join com_member c on c.m_email=m.m_email where m_wdraing=0 )"+
						" where rnum between ? and ?";
			}
			else if(sep.contains("분류")){
				query = "select * from (select rownum rnum, m.m_email, m.m_name, m.m_sep, nvl2(p.pm_name, p.pm_name, c.cm_name), nvl2(p.pm_phone, p.pm_phone, c.cm_phone) " + 
						"from member m " + 
						"left outer join per_member p on p.m_email=m.m_email " + 
						"left outer join com_member c on c.m_email=m.m_email " + 
						"where m_sep like '%"+keyword+"%' and m_wdraing=0) "+
						"where rnum between ? and ? ";
			}
			else {
				query = "select * from (select rownum rnum, m.m_email, m.m_name, m.m_sep, nvl2(p.pm_name, p.pm_name, c.cm_name), nvl2(p.pm_phone, p.pm_phone, c.cm_phone) " + 
						"from member m " + 
						"left outer join per_member p on p.m_email=m.m_email " + 
						"left outer join com_member c on c.m_email=m.m_email " + 
						"where m_name like '%"+keyword+"%' and m_wdraing=0) "+
						"where rnum between ? and ? ";	
				
			}
			
			try {	

				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);	
				rs = pstmt.executeQuery();
				
					
					while(rs.next()) {
						
						JSONObject memobj = new JSONObject();
						
						memobj.put("m_email", rs.getString(2));
						memobj.put("m_nick", rs.getString(3));
						memobj.put("m_sep", rs.getString(4));
						memobj.put("m_name", rs.getString(5));
						memobj.put("m_phone", rs.getString(6));
						
				
						jarr.add(memobj);
					}
					
					jobj.put("memberlist", jarr);
				}
				catch (SQLException e) {
					e.printStackTrace();
				}

			return jobj;
		
		}
		
	// 재능관리 부분
		public String pagingTalProc(int currentPage, int pageSize, int pageBlock, int totalPages, String req, int cate,String keyword, String sep) {

			int blockStart, blockEnd;
			blockStart = ((currentPage - 1) / pageBlock) * pageBlock + 1;
			blockEnd = blockStart + pageBlock - 1 > totalPages ? totalPages : blockStart + pageBlock - 1;
			String pblock = "<div style='width:100%;text-align:center'>";
			// 1. previous |< <
			if (blockStart > 1) {
				pblock += String.format("<a class='plain' href='"+req+".do?sep=%s&page=%d&keyword=%s&cate=%s'>&nbsp;≤&nbsp;</a> ",sep, 1, keyword, cate);
				pblock += String.format("<a class='plain' href='"+req+".do?sep=%s&page=%d&keyword=%s&cate=%s'>＜&nbsp;</a> ",sep, blockStart - 1, keyword, cate);
			}

			// 2.
			for (int i = blockStart; i <= blockEnd; i++) {
				if (currentPage == i) {
					pblock += "<span id='curSpan' style='color:darkgreen'>" + i + "</span>&nbsp;";
				} else {
					pblock += String.format("<a class='plain' style='color:gray' href='"+req+".do?sep=%s&page=%d&keyword=%s&cate=%s'>%d</a> ",sep, i, keyword, cate, i);
				}
			}

			// 3. next > >|
			if (blockEnd < totalPages) {
				pblock += String.format("<a class='plain' href='"+req+".do?sep=%s&page=%d&keyword=%s&cate=%s'>&nbsp;>&nbsp;</a> ",sep, blockEnd + 1, keyword, cate);

				pblock += String.format("<a class='plain' href='"+req+".do?sep=%s&page=%d&keyword=%s&cate=%s'>≥&nbsp;</a> ",sep,totalPages, keyword, cate);

			}
			pblock += "</div>";

			return pblock;
		}
	
		// 재능 갯수 가져오는 함수
		public int getTotalTalRecords(Connection conn, String keyword, int cate, String sep ) {
			
			// keyword 개인, 기업 
			// cate c_id
			// sep 승인중 판매중
			
			String query ;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int cnt = 0;
			String sub = null;
			
			if (cate==0) {
				sub = "";
			}else {
				sub = " and category.c_superid in ("+cate+")";
			}
			
			if (sep.contains("승인중")) { // ad_tal.do 요청에 의한 승인중 재능만...
				
				query = "select count(*) from ( "+
						"select distinct talent.t_seq, talent.t_name, talent.m_email,t_option.op_price, m_name, m_sep, gs_name, to_char(t_upload, 'yyyy.MM.dd' )" + 
						"from talent " + 
						"join cat_arrange on cat_arrange.t_seq = talent.t_seq " + 
						"join category on category.c_id = cat_arrange.c_id " + 
						"join member on talent.m_email = member.m_email " + 
						"join t_option on t_option.t_seq = talent.t_seq " + 
						"join tal_state on tal_state.t_seq=talent.t_seq " + 
						"join (select m_email, gs_name from grade join g_separate on g_separate.gs_seq = grade.gs_seq) grade on grade.m_email = member.m_email " + 
						"where t_option.op_seq=1 and ts_name like '%승인중%' and m_sep like '%"+keyword+"%' "+sub+" )";
				
			} else { 
				
				query = "select count(*) from ( "+
						"select distinct talent.t_seq, talent.t_name, talent.m_email, t_option.op_price, ts_name, m_name, m_sep, gs_name, to_char(t_date, 'yyyy.MM.dd' )" + 
						"from talent " + 
						"join cat_arrange on cat_arrange.t_seq = talent.t_seq " + 
						"join category on category.c_id = cat_arrange.c_id " + 
						"join member on talent.m_email = member.m_email " + 
						"join t_option on t_option.t_seq = talent.t_seq " + 
						"join tal_state on tal_state.t_seq=talent.t_seq " + 
						"join (select m_email, gs_name from grade join g_separate on g_separate.gs_seq = grade.gs_seq) grade on grade.m_email = member.m_email " + 
						"where t_option.op_seq=1 and ts_name like '%"+sep+"%' and m_sep like '%"+keyword+"%' "+sub+" )";
				
			} 
			
			
			
			try {
				pstmt = conn.prepareStatement(query);

			
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
				
					cnt=rs.getInt(1);
				
				}
				
			} catch (Exception ex) {
				
				System.out.println(">"+ex.toString());
				
			}
			return cnt;
		}
		
		public JSONObject selectTalentList(Connection conn,int start, int end, String keyword, int cate,String sep ) {

			JSONObject jobj = new JSONObject();
			JSONArray jarr = new JSONArray();
			

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String query=null ;
			String sub = null;
			
			if (cate==0) {
				sub = "";
			}else {
				sub = " and category.c_superid in ("+cate+")";
			}
			
			if (sep.contains("승인중")) { // ad_tal.do 요청에 의한 승인중 재능만...
				
				query = "select * from ( " + 
						"select rownum rnum, t_seq, t_name, m_email, op_price, m_name, m_sep, gs_name, t_upload from ( " + 
						"select distinct talent.t_seq , talent.t_name, talent.m_email, t_option.op_price, m_name, m_sep, gs_name, to_char(t_upload, 'yyyy.MM.dd') t_upload " + 
						"from talent " + 
						"join cat_arrange on cat_arrange.t_seq = talent.t_seq " + 
						"join category on category.c_id = cat_arrange.c_id " + 
						"join member on talent.m_email = member.m_email " + 
						"join t_option on t_option.t_seq = talent.t_seq " + 
						"join tal_state on tal_state.t_seq=talent.t_seq " + 
						"join (select m_email, gs_name from grade join g_separate on g_separate.gs_seq = grade.gs_seq) grade on grade.m_email = member.m_email " + 
						"where t_option.op_seq=1 and ts_name like '%승인중%' and m_sep like '%"+keyword+"%' " +sub + 
						" order by t_seq ) ) where rnum between ? and ?";
				
			} else { // 판매중인 재능...
				
				query = "select * from ( " + 
						"select rownum rnum, t_seq, t_name, m_email, op_price, m_name, m_sep, gs_name, t_date, ts_name from ( " + 
						"select distinct talent.t_seq , talent.t_name, talent.m_email, t_option.op_price, m_name, m_sep, gs_name, to_char(t_date, 'yyyy.MM.dd') t_date , ts_name " + 
						"from talent " + 
						"join cat_arrange on cat_arrange.t_seq = talent.t_seq " + 
						"join category on category.c_id = cat_arrange.c_id " + 
						"join member on talent.m_email = member.m_email " + 
						"join t_option on t_option.t_seq = talent.t_seq " + 
						"join tal_state on tal_state.t_seq=talent.t_seq " + 
						"join (select m_email, gs_name from grade join g_separate on g_separate.gs_seq = grade.gs_seq) grade on grade.m_email = member.m_email " + 
						"where t_option.op_seq=1 and ts_name not like '%승인중%' and ts_name not like '%삭제%' and m_sep like '%"+keyword+"%' "+sub +
						" order by t_seq ) ) where rnum between ? and ?";
				
			} 
			
			
			try {	

				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);	
				rs = pstmt.executeQuery();
				
					
					while(rs.next()) {
						
						JSONObject talobj = new JSONObject();
						
						talobj.put("t_seq", rs.getInt(2));
						talobj.put("t_name", rs.getString(3));
						talobj.put("m_email", rs.getString(4));
						talobj.put("op_price", rs.getInt(5));
						talobj.put("m_name", rs.getString(6));
						talobj.put("m_sep", rs.getString(7));
						talobj.put("gs_name", rs.getString(8));
						talobj.put("date", rs.getString(9));
						if (!sep.contains("승인중")) {
						talobj.put("ts_name", rs.getString(10));
						}
						
				
						jarr.add(talobj);
					}
					
					jobj.put("talentlist", jarr);
				}
				catch (SQLException e) {
					e.printStackTrace();
				}

			return jobj;
		
		}
		
	
	
	
	
		// 신고관리부분
		public String pagingRepProc(int currentPage, int pageSize, int pageBlock, int totalPages, String req) {

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
		
		// 신고 갯수 가져오기 함수. 
			public int getTotalRepRecords(Connection conn ) {
				
				
				String query ;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				int cnt = 0;
				
				
				query = "select count(*) from ( "+
						"select r_con, r_email, r_nick from report where a_id is null " + 
						"union all " + 
						"select r_con, r_email, r_nick from report where a_id is not null"+
						" )";
				
				try {
					
					pstmt = conn.prepareStatement(query);
					
					rs = pstmt.executeQuery();
					
					while (rs.next()) {
					
						cnt=rs.getInt(1);
					
					}
					
				} catch (Exception ex) {
					
					System.out.println(ex.toString());
					
				}
				return cnt;
			}
			
			// 신고 내역 가져오기. 
			public JSONObject selectRepList(Connection conn,int start, int end ) {

				JSONObject jobj = new JSONObject();
				JSONArray jarr = new JSONArray();
				

				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String query=null ;
				
				query = "select * from ( "+
						"select rownum rnum, r_con, r_email, r_nick, r_seq, ck from ( "+
						"select r_con, r_email, r_nick, r_seq, 0 ck from report where a_id is null " + 
						"union all " + 
						"select r_con, r_email, r_nick, r_seq, 1 ck from report where a_id is not null"+
						" ) " +
						" ) where rnum between ? and ? ";
				
				

			try {	

					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, start);
					pstmt.setInt(2, end);	
					rs = pstmt.executeQuery();
					
						
						while(rs.next()) {
							
							JSONObject repobj = new JSONObject();
							
							repobj.put("r_con", rs.getString(2));
							repobj.put("r_email", rs.getString(3));
							repobj.put("r_nick", rs.getString(4));
							repobj.put("r_seq", rs.getInt(5));
							repobj.put("ck", rs.getInt(6));
							
							jarr.add(repobj);
						}
						
						jobj.put("reportlist", jarr);
					}
					catch (SQLException e) {
						e.printStackTrace();
					}

				return jobj;
			
			}
			
	
	
	
	
	
	
	
			// 일대일문의관리부분
			
			// 일대일문의 갯수 가져오기 함수. 
				public int getTotalQnaRecords(Connection conn ) {
					
					
					String query ;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					int cnt = 0;
					
					
					query = "select count(*) from ( "+
							"select one_email, one_sub, one_con, one_date, 0 , one_seq from one_QA where a_id is null " + 
							"union all " + 
							"select one_email, one_sub, one_con, one_date, 1, one_seq from one_QA where a_id is not null "+
							" )";
					
					try {
						
						pstmt = conn.prepareStatement(query);
						
						rs = pstmt.executeQuery();
						
						while (rs.next()) {
						
							cnt=rs.getInt(1);
						
						}
						
					} catch (Exception ex) {
						
						System.out.println(ex.toString());
						
					}
					return cnt;
				}
				
				// 일대일문의 내역 가져오기. 
				public JSONObject selectQnaList(Connection conn,int start, int end ) {

					JSONObject jobj = new JSONObject();
					JSONArray jarr = new JSONArray();
					

					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					String query=null ;
					
					query = "select * from ( "+
							"select rownum rnum , one_email, one_sub, one_con, to_char(one_date, 'yyyy.MM.dd'), ck, one_seq from ( "+
							"select one_email, one_sub, one_con, one_date, 0 ck , one_seq from one_QA where a_id is null " + 
							"union all " + 
							"select one_email, one_sub, one_con, one_date, 1 ck , one_seq from one_QA where a_id is not null "+
							" ) "+
							" ) where rnum between ? and ? ";
					
					try {	

						pstmt = conn.prepareStatement(query);
						pstmt.setInt(1, start);
						pstmt.setInt(2, end);	
						rs = pstmt.executeQuery();
						
							
							while(rs.next()) {
								
								JSONObject qnaobj = new JSONObject();
								
								qnaobj.put("one_email", rs.getString(2));
								qnaobj.put("one_sub", rs.getString(3));
								qnaobj.put("one_con", rs.getString(4));
								qnaobj.put("one_date", rs.getString(5));
								qnaobj.put("ck", rs.getInt(6));
								qnaobj.put("o_seq", rs.getInt(7));
								
								jarr.add(qnaobj);
							}
							
							jobj.put("qnalist", jarr);
						}
						catch (SQLException e) {
							e.printStackTrace();
						}

					return jobj;
				
				}
				
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
