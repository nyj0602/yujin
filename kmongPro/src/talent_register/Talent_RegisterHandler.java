package talent_register;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;


public class Talent_RegisterHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Cookie [] cookies = request.getCookies();
		
		String gtitleInput = null;
		String AS_context = null;
		String service_content = null;
		String plus_question = null;
		
		  if( cookies != null && cookies.length > 0){
			  for(int i=0; i< cookies.length ; i++){
				  if( cookies[i].getName().equals("gtitleInput")) {
					  gtitleInput = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("AS_context")) {
					  AS_context = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("service_content")) {
					  service_content = URLDecoder. decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("plus_question")) {
					  plus_question = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
			  }
		  }
		  
		String p_plus_question = request.getParameter("plus_question");
		String p_sel_box = request.getParameter("sel_box");
		String p_qqss[] = request.getParameterValues("qqss");
		String p_qqtt[] = request.getParameterValues("qqtt");
		
		/*Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//conn = DriverManager.getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "SCOTT", "TIGER");*/
		
		Connection conn = DBConn.getConnection();
		
		// Talent 테이블 인서트
		
		String sql = "insert into talent (t_seq, t_name, t_upload, t_as, t_request, t_service, t_date, m_email) values (talent_no_seq.nextval, ?, sysdate, ?, ?, ?, '18/04/01', 'jsaa11@naver.com')";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		int result = 0;

		try {
			pstmt.setString(1, gtitleInput.toString());
			pstmt.setString(2, AS_context.toString());
			pstmt.setString(3, service_content.toString());
			pstmt.setString(4, p_plus_question.toString());
			result = pstmt.executeUpdate();

		}catch (SQLException e) { 
			e.printStackTrace();
		} finally{
			try {
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		//System.out.println("> > > " + cookies.toString());
		 
		
		
		// 카테고리 배치 테이블 인서트
		
		// 재능코드 변수에 저장.
		ResultSet rs = null;
		String sql_max = "select max(t_seq) talseq from talent";
		Statement pstmt_max = conn.createStatement();
		rs = pstmt_max.executeQuery(sql_max);

		String t_seqMAX = null;
		try {
			while(rs.next()) {
				t_seqMAX = rs.getString(1);
			}
		}catch (SQLException e) { 
			e.printStackTrace();
		} finally{
			try {
				pstmt_max.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		
		
		//재능상태테이블 인서트
		
		String sql_state = "insert into tal_state (ts_name, t_seq ) values ( '비승인', " + t_seqMAX + ")";
		PreparedStatement pstmt_state = conn.prepareStatement(sql_state);
		int result_state = 0;
		
		try {
			result_state = pstmt_state.executeUpdate();
		}catch (SQLException e) { 
			e.printStackTrace();
		} finally{
			try {
				pstmt.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		String sel_first = null;
		String sel_second = null;
		String sel_third = null;
		String gigMetadataLink1= null;
		String five = null;
		
	
		if( cookies != null && cookies.length > 0){
			  for(int i=0; i< cookies.length ; i++){
				  if(cookies[i].getName().equals("sel_first")) {
					 sel_first = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("sel_second")) {
					  sel_second = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("sel_third")) {
					  sel_third = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("p_gigMetadataLink1")) {
					  gigMetadataLink1 = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("five")) {
					  five = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
			  }
		}
		
		// 중분류 인서트
		String sql_cat = "insert into cat_arrange (c_id, t_seq) values (?," + t_seqMAX + ")";
		PreparedStatement pstmt_cat = conn.prepareStatement(sql_cat);
		int result_cat = 0;
		try {
			pstmt_cat.setInt(1, Integer.parseInt(sel_second));
			result_cat = pstmt_cat.executeUpdate();
		}catch (SQLException e) { 
			e.printStackTrace();
		} finally{
			try {
				pstmt_cat.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		
		// 소분류 인서트
		if( sel_third != null) {
		String sql_cat1 = "insert into cat_arrange (c_id, t_seq) values (?, "+ t_seqMAX +" )";
		PreparedStatement pstmt_cat1 = conn.prepareStatement(sql_cat1);
		int result_cat1 = 0;
			
		try {
			pstmt_cat1.setInt(1, Integer.parseInt(sel_third));
			result_cat1 = pstmt_cat1.executeUpdate();
		}catch (SQLException e) { 
			e.printStackTrace();
		} finally{
			try {
				pstmt_cat1.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		}
		// 두꺼운 글씨 인서트
		String sql_cat2 = "insert into cat_arrange (c_id, t_seq) values (?, "+ t_seqMAX +" )";
		PreparedStatement pstmt_cat2 = conn.prepareStatement(sql_cat2);
		int result_cat2 = 0;
			
		try {
			pstmt_cat2.setInt(1, Integer.parseInt(gigMetadataLink1));
			result_cat2 = pstmt_cat2.executeUpdate();
		}catch (SQLException e) { 
			e.printStackTrace();
		} finally{
			try {
				pstmt_cat2.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		
		// 체크박스 인서트 
		String sql_cat3 = "insert into cat_arrange (c_id, t_seq) values (?, "+ t_seqMAX +" )";
		PreparedStatement pstmt_cat3 = conn.prepareStatement(sql_cat3);
		int result_cat3 = 0;
			
		try {
			pstmt_cat3.setInt(1, Integer.parseInt(five));
			result_cat3 = pstmt_cat3.executeUpdate();
		}catch (SQLException e) { 
			e.printStackTrace();
		} finally{
			try {
				pstmt_cat3.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		
		
		
		
		//  옵션테이블 인서트
		
		// 쿠키값 가져오기
		String stntitle = null;
		String deltitle = null;
		String pretitle = null;
		String stncontent = null;
		String delcontent = null;
		String precontent = null;
		String stnprice =null;
		String delprice = null;
		String preprice = null;
		String stn_revision = null;
		String del_revision = null;
		String pre_revision = null;
		String stn_days = null;
		String del_days = null;
		String pre_days = null;
		String fast_ob = null;
		String fast_days = null;
		String plus_revision = null;
		String revision_days = null;
		String op_title = null;
		String op_content = null;
		String op_price = null;
		String op_days = null;
		
		if( cookies != null && cookies.length > 0){
			for(int i=0; i< cookies.length ; i++){
				  if( cookies[i].getName().equals("stntitle")) {
					 stntitle = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("deltitle")) {
					 deltitle = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("pretitle")) {
					 pretitle = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("stncontent")) {
					 stncontent = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("delcontent")) {
					 delcontent = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("precontent")) {
					  precontent = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("stnprice")) {
					  stnprice = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("delprice")) {
					  delprice = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("preprice")) {
					  preprice = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("stn_revision")) {
					  	stn_revision = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("del_revision")) {
					  	del_revision = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("pre_revision")) {
					  	pre_revision = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("stn_days")) {
					  	stn_days = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("del_days")) {
					  	del_days = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("pre_days")) {
					  	pre_days = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("fast_ob")) {
					  	fast_ob = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("fast_days")) {
					  	fast_days = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("plus_revision")) {
					  	plus_revision = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("revision_days")) {
					  	revision_days = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("op_title")) {
					  	op_title = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("op_content")) {
					  	op_content = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("op_price")) {
					  	op_price = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("op_days")) {
					  	op_days = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("service_content")) {
					  service_content = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
				  if(cookies[i].getName().equals("AS_context")) {
					  AS_context = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				  }
			  }
		}
		
		
		// 옵션인서트
		// 스탠다드 인서트
		String sql_option = "insert into t_option values ("+ t_seqMAX +", 1, 'standard', ?, ?, ?, ?, ?)";
		PreparedStatement pstmt_option = conn.prepareStatement(sql_option);
		int result_option = 0;

		try {
			pstmt_option.setInt(1, Integer.parseInt(stnprice));
			pstmt_option.setInt(2, Integer.parseInt(stn_revision));
			pstmt_option.setInt(3, Integer.parseInt(stn_days));
			pstmt_option.setString(4, stntitle.toString());
			pstmt_option.setString(5, stncontent.toString());
			result_option = pstmt_option.executeUpdate();

		}catch (SQLException e) { 
			e.printStackTrace();
		} finally{
			try {
				pstmt_option.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		//System.out.println("> > > " + cookies.toString());
		
		// 디럭스, 프리미엄 인서트
		if( deltitle != null || pretitle != null) {
			// 디럭스
			String sql_optiona = "insert into t_option values ("+ t_seqMAX +", 2, 'deluxe', ?, ?, ?, ?, ?)";
			PreparedStatement pstmt_optiona = conn.prepareStatement(sql_optiona);
			int result_optiona = 0;

			try {
				pstmt_optiona.setInt(1, Integer.parseInt(delprice));
				pstmt_optiona.setInt(2, Integer.parseInt(del_revision));
				pstmt_optiona.setInt(3, Integer.parseInt(del_days));
				pstmt_optiona.setString(4, deltitle.toString());
				pstmt_optiona.setString(5, delcontent.toString());
				result_optiona = pstmt_optiona.executeUpdate();

			}catch (SQLException e) { 
				e.printStackTrace();
			} finally{
				try {
					pstmt_optiona.close();
				} catch (SQLException e) { 
					e.printStackTrace();
				}
			}
			
			// 프리미엄
			String sql_optionb = "insert into t_option values ("+ t_seqMAX +", 3, 'premium', ?, ?, ?, ?, ?)";
			PreparedStatement pstmt_optionb = conn.prepareStatement(sql_optionb);
			int result_optionb = 0;

			try {
				pstmt_optionb.setInt(1, Integer.parseInt(preprice));
				pstmt_optionb.setInt(2, Integer.parseInt(pre_revision));
				pstmt_optionb.setInt(3, Integer.parseInt(pre_days));
				pstmt_optionb.setString(4, pretitle.toString());
				pstmt_optionb.setString(5, precontent.toString());
				result_optionb = pstmt_optionb.executeUpdate();

			}catch (SQLException e) { 
				e.printStackTrace();
			} finally{
				try {
					pstmt_optionb.close();
				} catch (SQLException e) { 
					e.printStackTrace();
				}
			}
		} // if 닫기
		
		
		//  추가옵션 인서트
		//  빠른 작업
		
		if(fast_ob != null) {
		String sql_optionb = "insert into t_option values ("+ t_seqMAX +", 4, '추가옵션', ?, ?, 0, ?, ?)";
		PreparedStatement pstmt_optionb = conn.prepareStatement(sql_optionb);
		int result_optionb = 0;

		try {
			pstmt_optionb.setInt(1, Integer.parseInt(fast_ob));
			pstmt_optionb.setInt(2, Integer.parseInt(fast_days));
			pstmt_optionb.setInt(3, Integer.parseInt(pre_days));
			pstmt_optionb.setString(4, pretitle.toString());
			pstmt_optionb.setString(5, precontent.toString());
			result_optionb = pstmt_optionb.executeUpdate();

		}catch (SQLException e) { 
			e.printStackTrace();
		} finally{
			try {
				pstmt_optionb.close();
			} catch (SQLException e) { 
				e.printStackTrace();
			}
		}
		}
		
		
		
		// 쿠키 삭제.
		/*Cookie cookie_gtitleInput = new Cookie("gtitleInput",""); 
		cookie_gtitleInput.setMaxAge(0);
		cookie_gtitleInput.setPath("/");
		response.addCookie(cookie_gtitleInput);

		Cookie cookie_AS_context  = new Cookie("AS_context",""); 
		cookie_AS_context.setMaxAge(0);
		cookie_AS_context.setPath("/");
		response.addCookie(cookie_AS_context );

		Cookie cookie_service_content  = new Cookie("service_content",""); 
		cookie_service_content.setMaxAge(0);
		cookie_service_content.setPath("/");
		response.addCookie(cookie_service_content );

		Cookie cookie_plus_question  = new Cookie("plus_question",""); 
		cookie_plus_question.setMaxAge(0);
		cookie_plus_question.setPath("/");
		response.addCookie(cookie_plus_question );
		
		Cookie cookie_sel_first  = new Cookie("sel_first",""); 
		cookie_sel_first.setMaxAge(0);
		cookie_sel_first.setPath("/");
		response.addCookie(cookie_sel_first);

		Cookie cookie_sel_second   = new Cookie("sel_second",""); 
		cookie_sel_second.setMaxAge(0);
		cookie_sel_second.setPath("/");
		response.addCookie(cookie_sel_second );

		Cookie cookie_sel_third   = new Cookie("sel_third",""); 
		cookie_sel_third.setMaxAge(0);
		cookie_sel_third.setPath("/");
		response.addCookie(cookie_sel_third );

		Cookie cookie_gigMetadataLink1   = new Cookie("gigMetadataLink1",""); 
		cookie_gigMetadataLink1.setMaxAge(0);
		cookie_gigMetadataLink1.setPath("/");
		response.addCookie(cookie_gigMetadataLink1 );
		
		Cookie cookie_five   = new Cookie("five",""); 
		cookie_five.setMaxAge(0);
		cookie_five.setPath("/");
		response.addCookie(cookie_five);

		Cookie cookie_stntitle    = new Cookie("stntitle",""); 
		cookie_stntitle.setMaxAge(0);
		cookie_stntitle.setPath("/");
		response.addCookie(cookie_stntitle );

		Cookie cookie_deltitle    = new Cookie("deltitle",""); 
		cookie_deltitle.setMaxAge(0);
		cookie_deltitle.setPath("/");
		response.addCookie(cookie_deltitle );

		Cookie cookie_pretitle    = new Cookie("pretitle",""); 
		cookie_pretitle.setMaxAge(0);
		cookie_pretitle.setPath("/");
		response.addCookie(cookie_pretitle );
		
		Cookie cookie_stncontent     = new Cookie("stncontent",""); 
		cookie_stncontent.setMaxAge(0);
		cookie_stncontent .setPath("/");
		response.addCookie(cookie_stncontent );

		Cookie cookie_delcontent     = new Cookie("delcontent",""); 
		cookie_delcontent.setMaxAge(0);
		cookie_delcontent.setPath("/");
		response.addCookie(cookie_delcontent );

		Cookie cookie_precontent     = new Cookie("precontent",""); 
		cookie_precontent.setMaxAge(0);
		cookie_precontent.setPath("/");
		response.addCookie(cookie_precontent );
		
		Cookie cookie_stnprice      = new Cookie("stnprice",""); 
		cookie_stnprice.setMaxAge(0);
		cookie_stnprice.setPath("/");
		response.addCookie(cookie_stnprice );

		Cookie cookie_delprice     = new Cookie("delprice",""); 
		cookie_delprice.setMaxAge(0);
		cookie_delprice.setPath("/");
		response.addCookie(cookie_delprice );

		Cookie cookie_preprice     = new Cookie("preprice",""); 
		cookie_preprice.setMaxAge(0);
		cookie_preprice.setPath("/");
		response.addCookie(cookie_preprice );
		
		Cookie cookie_stn_revision       = new Cookie("stn_revision",""); 
		cookie_stn_revision .setMaxAge(0);
		cookie_stn_revision .setPath("/");
		response.addCookie(cookie_stn_revision );

		Cookie cookie_del_revision      = new Cookie("del_revision",""); 
		cookie_del_revision .setMaxAge(0);
		cookie_del_revision .setPath("/");
		response.addCookie(cookie_del_revision );

		Cookie cookie_pre_revision      = new Cookie("pre_revision",""); 
		cookie_pre_revision .setMaxAge(0);
		cookie_pre_revision .setPath("/");
		response.addCookie(cookie_pre_revision );
		
		Cookie cookie_stn_days       = new Cookie("stn_days",""); 
		cookie_stn_days .setMaxAge(0);
		cookie_stn_days .setPath("/");
		response.addCookie(cookie_stn_days );

		Cookie cookie_del_days       = new Cookie("del_days",""); 
		cookie_del_days .setMaxAge(0);
		cookie_del_days .setPath("/");
		response.addCookie(cookie_del_days );
		
		Cookie cookie_pre_days       = new Cookie("pre_days",""); 
		cookie_pre_days .setMaxAge(0);
		cookie_pre_days .setPath("/");
		response.addCookie(cookie_pre_days );
		
		Cookie cookie_fast_ob        = new Cookie("fast_ob ",""); 
		cookie_fast_ob .setMaxAge(0);
		cookie_fast_ob .setPath("/");
		response.addCookie(cookie_fast_ob );
		
		Cookie cookie_fast_days        = new Cookie("fast_days",""); 
		cookie_fast_days  .setMaxAge(0);
		cookie_fast_days  .setPath("/");
		response.addCookie(cookie_fast_days );
		
		Cookie cookie_plus_revision         = new Cookie("plus_revision ",""); 
		cookie_plus_revision .setMaxAge(0);
		cookie_plus_revision .setPath("/");
		response.addCookie(cookie_plus_revision );
		
		Cookie cookie_revision_days         = new Cookie("revision_days",""); 
		cookie_revision_days  .setMaxAge(0);
		cookie_revision_days  .setPath("/");
		response.addCookie(cookie_revision_days );
		
		Cookie cookie_op_title          = new Cookie("op_title",""); 
		cookie_op_title .setMaxAge(0);
		cookie_op_title .setPath("/");
		response.addCookie(cookie_op_title );
		
		Cookie cookie_op_content          = new Cookie("op_content",""); 
		cookie_op_content  .setMaxAge(0);
		cookie_op_content  .setPath("/");
		response.addCookie(cookie_op_content );
		
		Cookie cookie_op_price           = new Cookie("op_price",""); 
		cookie_op_price .setMaxAge(0);
		cookie_op_price .setPath("/");
		response.addCookie(cookie_op_price );
		
		Cookie cookie_op_days           = new Cookie("op_days",""); 
		cookie_op_days  .setMaxAge(0);
		cookie_op_days  .setPath("/");
		response.addCookie(cookie_op_days );*/
		
		return "/WEB-INF/view/talent_register/talent_registerEnd.jsp";
		
		
	}

}
