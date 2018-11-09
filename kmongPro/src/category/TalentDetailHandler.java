package category;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class TalentDetailHandler  implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement  pstmt = null;
		String sql = "";
		
		int num = Integer.parseInt(request.getParameter("t_seq"));
		System.out.println(num);
		JSONObject talent = new JSONObject();
		JSONArray talentArr = new JSONArray();
		JSONObject talentObj = new JSONObject();
		
		JSONObject image = new JSONObject();		JSONArray imageArr = new JSONArray();
		JSONObject category = new JSONObject();	JSONArray catArr = new JSONArray();
		JSONObject price = new JSONObject();		JSONArray priceArr = new JSONArray();
		JSONObject star = new JSONObject();		JSONArray starArr = new JSONArray();
		JSONObject evaluation = new JSONObject();		JSONArray evalArr = new JSONArray();
		JSONObject complete = new JSONObject();		JSONArray comArr = new JSONArray();
		JSONObject time = new JSONObject();		JSONArray timeArr = new JSONArray();
		JSONObject option = new JSONObject();		JSONArray optionArr = new JSONArray();
		JSONObject vacation = new JSONObject();		JSONArray vacArr = new JSONArray();
		JSONObject message = new JSONObject();		JSONArray msgArr = new JSONArray();
		JSONObject name = new JSONObject();	
		String tName="";
		ResultSet rs = null;
		try {
			//재능 상세페이지 하나만 들어가는 데이터
			sql  =  " select distinct ca.t_seq t_seq, m_name, m_sep ,m_profile, gs_name, t_name, t.m_email m_email, t_as , t_request ,t_service, m_intros ";
			sql += " from cat_arrange ca join talent t on t.t_seq=ca.t_seq join tal_state ts on ts.t_seq= t.t_seq join member m on m.m_email=t.m_email  join grade g on g.m_email=m.m_email join g_separate gs on gs.gs_seq=g.gs_seq ";
			sql += " where ca.t_seq=? ";
			sql += " and ts_name='판매중' ";
                                                                                                                                                                                                             
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				talentObj.put("t_seq", rs.getInt(1));
				talentObj.put("m_name", rs.getString(2));
				talentObj.put("m_sep", rs.getString(3));
				talentObj.put("m_profile", rs.getString(4));
				talentObj.put("gs_name", rs.getString(5));
				talentObj.put("t_name", rs.getString(6));
				talentObj.put("m_email", rs.getString(7));
				talentObj.put("t_as", rs.getString(8));
				talentObj.put("t_request", rs.getString(9));
				talentObj.put("t_service", rs.getString(10));
				talentObj.put("m_intros", rs.getString(11));
				
				talentArr.add(talentObj);
				talent.put("ta", talentArr);
			}//while재능 상세페이지 하나만 들어가는 데이터
			
			//이미지
			sql = " select image,rownum,t_name from image i join talent t on i.t_seq=t.t_seq where i.t_seq=? ";
                                                                                                                                                                                                             
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				image.put("image", rs.getString(1));
				image.put("rownum", rs.getInt(2));
				image.put("t_name", rs.getString(3));
				
				imageArr.add(image);
			}//이미지 관련 데이터
			
			//재능카테고리 가져오기
			sql   = " select t_seq, c.c_id c_id, c_group, (select c_group from category where c_id = (select c_superid from cat_arrange ca join category c on ca.c_id=c.c_id where t_seq=? and c_level <=2 )) bigcat";
			sql += " ,(select c_id from category where c_id = (select c_superid from cat_arrange ca join category c on ca.c_id=c.c_id where t_seq=? and c_level <=2 )) big_cat_num ";
			sql += " from cat_arrange ca join category c on ca.c_id=c.c_id ";
			sql += " where  c_level<=3 and t_seq = ? " ;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, num);
			pstmt.setInt(3, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				category.put("t_seq", rs.getInt(1));
				category.put("c_id", rs.getInt(2));
				category.put("c_group", rs.getString(3));
				category.put("bigcat", rs.getString(4));
				category.put("big_cat_num", rs.getInt(5));
				catArr.add(category);
			}//카테고리 관련 데이터
			
			//standard,deluxe,premium 재능 가격 가져오기
			sql  =  " select o.t_seq, op_seq, op_sep, op_price, op_term, op_change, op_manual1, op_manual2 ,m_email ";
			sql += "  from t_option o join talent t on o.t_seq=t.t_seq where op_sep in ('standard','deluxe','premium') and o.t_seq=? ";
			sql += " order by op_seq ";
            
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				price.put("t_seq", rs.getInt(1));
				price.put("op_seq", rs.getInt(2));
				price.put("op_sep", rs.getString(3));
				price.put("op_price", rs.getInt(4));
				price.put("op_term", rs.getInt(5));
				price.put("op_change", rs.getInt(6));
				price.put("op_manual1", rs.getString(7));
				price.put("op_manual2", rs.getString(8));
				price.put("m_email", rs.getString(9));
				
				priceArr.add(price);
			}//재능 가격 데이터
			
			//전체별점
			sql  =  " select avg(e_star) avg, count(*) count ";
			sql += " from  ( select pl.t_seq, e_star, rank() over (partition by t_seq order by op_seq) rank ";
			sql += " from evaluation e join t_order od on e.order_num=od.order_num join payment p on p.p_seq=od.p_seq join payment_list pl on pl.p_seq=p.p_seq ";
			sql += " where p.p_sep='서비스 구매' ) ";
			sql += " where rank=1 and t_seq=? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				star.put("avg", rs.getDouble(1));
				star.put("count", rs.getInt(2));
				
				starArr.add(star);
			}//전체별점 데이터
			
			sql  =  " select t_seq, e_content, e_star,  m_email ,m_profile ,e_date";
			sql += " from ( select pl.t_seq, e_star, rank() over (partition by t_seq order by op_seq) rank,e_content, m.m_email, m_profile, to_char(e_date,'yy.mm.dd HH24:MI') e_date  ";
			sql += " from evaluation e join t_order od on e.order_num=od.order_num join payment p on p.p_seq=od.p_seq join payment_list pl on pl.p_seq=p.p_seq  join member m on p.m_email=m.m_email ";
			sql += " where p.p_sep='서비스 구매' ) ";
			sql += " where rank=1 and t_seq = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				evaluation.put("t_seq", rs.getInt(1));
				evaluation.put("e_content", rs.getString(2));
				evaluation.put("e_star", rs.getDouble(3));
				evaluation.put("m_email", rs.getString(4));
				evaluation.put("m_profile", rs.getString(5));
				evaluation.put("e_date", rs.getString(6));
				
				evalArr.add(evaluation);
			
			}//평가 데이터
			
			//주문완료개수
			sql  =  " select count(*) count from ( 	select pl.t_seq, rank() over (partition by t_seq order by op_seq) rank ";
			sql += " from completed c join t_order od on c.order_num=od.order_num join payment p on p.p_seq=od.p_seq join payment_list pl on pl.p_seq=p.p_seq ";
			sql += " where p.p_sep='서비스 구매' )  where rank=1 and t_seq=?	";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				complete.put("count", rs.getInt(1));
				
				comArr.add(complete);
			
			}//평가 데이터
			
			//연락가능 시간
			sql = " select m_email email, t_seq, cm_call_1 time_1, cm_call_2 time_2  ";
			sql += " from(  select cm.m_email,t_seq , cm_call_1 , cm_call_2 ";
			sql += " from com_member cm join talent t on cm.m_email=t.m_email ";
			sql += " union ";
			sql += " select pm.m_email,t_seq, pm_call_1, pm_call_2 ";
			sql += " from per_member pm join talent t on pm.m_email=t.m_email ";
			sql += " )where t_seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				time.put("email", rs.getString(1));
				time.put("t_seq", rs.getInt(2));
				time.put("time_1", rs.getInt(3));
				time.put("time_2", rs.getInt(4 ));
				
				timeArr.add(time);
			}//연락가능시간 데이터
			
			//추가옵션,맞춤옵션 가격 가져오기
			sql  =  " select t_seq, op_seq, op_sep, op_price, op_term, op_change, op_manual1, op_manual2 ";
			sql += " from t_option where op_sep not in ('standard','deluxe','premium') and t_seq=?  ";
			sql += " order by op_seq ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				option.put("t_seq", rs.getInt(1));
				option.put("op_seq", rs.getInt(2));
				option.put("op_sep", rs.getString(3));
				option.put("op_price", rs.getInt(4));
				option.put("op_term", rs.getInt(5));
				option.put("op_change", rs.getInt(6));
				option.put("op_manual1", rs.getString(7));
				option.put("op_manual2", rs.getString(8));
				
				optionArr.add(option);
			}//옵션가격 데이터
			
			//휴가안내
			sql = " select m_email, v_state, v_start, v_end, v_reason from( select vs.m_email, v_state, to_char(v_start,'yyyy-mm-dd HH24:MI:ss') v_start, to_char(v_end,'yyyy-mm-dd HH24:MI:ss') v_end, v_reason, rank() over (partition by vs.m_email order by v_seq desc) rank ";
			sql += " from vac_state vs join vacation v on vs.m_email=v.m_email where v_state = '휴가' ) ";
			sql += " where rank = 1 ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				vacation.put("m_email", rs.getString(1));
				vacation.put("v_state", rs.getString(2));
				vacation.put("v_start", rs.getString(3));
				vacation.put("v_end", rs.getString(4));
				vacation.put("v_reason", rs.getString(5));
				
				vacArr.add(vacation);
			}//휴가안내 데이터
			
			//메세지 연결
			sql = " select mr_seq from msg_relation mr join talent t on mr.t_seq=t.t_seq ";
			sql += " where t.t_seq=? and buy_email like 'jyj1212@hanmail.net' ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			//pstmt.setString(2, ""); -> session으로 들어온 email값으로 비교
			rs = pstmt.executeQuery();
			while (rs.next()) {
			message.put("mr_seq", rs.getInt(1));
			msgArr.add(message);
			}//메세지 연결 데이터
			
			
			
			sql = "select t_name from talent where t_seq=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				name.put("t_name", rs.getString(1));
		
			}//재능 명가져오기
			tName = (String) name.get("t_name");
			
			
		} catch (SQLException e) {
			System.out.println(e.toString());
		} catch (Exception e) {
			System.out.println(e.toString());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			// if (conn != null) try { conn.close();} catch (Exception e) { }
		}
		
		
		
		
		
		int separate = priceArr.size();
		System.out.println(separate);
		
		request.setAttribute("message", msgArr);
		request.setAttribute("vacation", vacArr);
		request.setAttribute("separate", separate);
		request.setAttribute("option", optionArr);
		request.setAttribute("time", timeArr);
		request.setAttribute("complete", comArr);
		request.setAttribute("evaluation", evalArr);
		request.setAttribute("star", starArr);
		request.setAttribute("prices", priceArr);
		request.setAttribute("category", catArr);
		request.setAttribute("image", imageArr);
		request.setAttribute("talent", talent);
		request.setAttribute("num", num);
		request.setAttribute("tName", tName);
		
		return "/WEB-INF/view/category/TalentDetail.jsp";
	}

}
