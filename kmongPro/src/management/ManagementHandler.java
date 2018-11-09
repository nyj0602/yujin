package management;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ManagementHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");
		//conn=DBConn.getConnection();
		PreparedStatement  pstmt = null;
		ResultSet rs = null;
		
		String email = (String) request.getSession().getAttribute("authUser");
		String order = request.getParameter("orderNum") ;
		String sql = "";
		
		JSONObject payment = new JSONObject();	JSONArray payArr = new JSONArray();
		JSONObject time = new JSONObject();	JSONArray timeArr = new JSONArray();
		JSONObject notice = new JSONObject();	JSONArray notArr = new JSONArray();
		JSONObject process = new JSONObject();	JSONArray proArr = new JSONArray();
		JSONObject evaluation = new JSONObject();		JSONArray evalArr = new JSONArray();
		JSONObject solution = new JSONObject();		JSONArray solArr = new JSONArray();
		JSONObject message = new JSONObject();		JSONArray msgArr = new JSONArray();
		JSONObject error = new JSONObject();		JSONArray errArr = new JSONArray();
		JSONObject addpay = new JSONObject();		JSONArray addArr = new JSONArray();
		
		
		try {
			//결제정보
			sql = " select * from( ";
			sql += " select od.order_num, pl.op_seq, od.p_seq, to_char(pd.PD_DATE,'yy.mm.dd HH24:MI') paytime, p.m_email buyer, t.m_email seller, t_name, t.t_request, image, rank() over(partition by t.t_seq order by i_seq) rank, p_state, op_sep, op_price, op_term, op_manual1, t.t_seq, p_price ";
			sql += " ,  CASE when (sysdate-t_date) < 30 then 10 when (sysdate-t_date) > 30 then 2 end cash , sell.m_profile sprofile , buy.m_profile bprofile";
			sql += " from t_order od join payment_done pd on od.P_SEQ=pd.p_seq join payment p on p.p_seq=od.p_seq join payment_list pl on p.p_seq=pl.p_seq ";
			sql += " join talent t on t.t_seq=pl.t_seq join image i on i.t_seq=t.t_seq join progress pro on pro.order_num = od.order_num join t_option op on pl.t_seq=op.t_seq and pl.op_seq=op.op_seq  join member sell on sell.m_email=t.m_email join member buy on buy.m_email = p.m_email";
			sql += " order by pl.op_seq) where rank = 1  and order_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				payment.put("order_num", rs.getInt(1));
				payment.put("op_seq", rs.getInt(2));
				payment.put("p_seq", rs.getInt(3));
				payment.put("paytime", rs.getString(4));
				payment.put("buyer", rs.getString(5));
				payment.put("seller", rs.getString(6));
				payment.put("t_name", rs.getString(7));
				payment.put("t_request", rs.getString(8));
				payment.put("image", rs.getString(9));
				payment.put("rank", rs.getInt(10));
				payment.put("p_state", rs.getString(11));
				payment.put("op_sep", rs.getString(12));
				payment.put("op_price", rs.getInt(13));
				payment.put("op_term", rs.getInt(14));
				payment.put("op_manual1", rs.getString(15));
				payment.put("t_seq", rs.getInt(16));
				payment.put("cash", rs.getInt(17));
				payment.put("sprofile", rs.getString(18));
				payment.put("bprofile", rs.getString(19));
				//payment.put("p_price", rs.getInt(20));
				payArr.add(payment);
			}//결제정보 
			
			
			//연락가능한시간, 연락처
			sql = " select m_email email, cm_call_1 time_1, cm_call_2 time_2 ,cm_phone phone from( ";
			sql += " select cm.m_email,cm_call_1 , cm_call_2 ,cm_phone 	from com_member cm ";
			sql += " union ";
			sql += " select pm.m_email, pm_call_1, pm_call_2,pm_phone	from per_member pm )   ";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
			time.put("email", rs.getString(1));
			time.put("time_1", rs.getInt(2));
			time.put("time_2", rs.getInt(3));
			time.put("phone", rs.getString(4));
			
			timeArr.add(time);
			}//연락가능한시간
			
			//베너 알림에 쓰기위해 사용
			sql = " select order_num, pr_seq, pr_solution, s_num from problum where order_num=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
			notice.put("order_num", rs.getInt(1));
			notice.put("pr_seq", rs.getInt(2));
			notice.put("pr_solution", rs.getString(3));
			notice.put("s_num", rs.getInt(4));
			
			notArr.add(notice);
			}//배너 알림
			
			//주문진행                                                                                                                                              
			
			sql = " select distinct pl.pl_seq, pl_sender, pl_content, pl_file,to_char(pl_sendTime, 'yy.mm.dd HH24:MI') sendtime, pl_check, pl.order_num, t_request ";
			sql += " from process_list pl join t_order od on pl.order_num=od.order_num join payment_list pay on od.p_seq=pay.p_seq join talent t on t.t_seq=pay.t_seq ";
			sql += " where pl.order_num=? order by pl.pl_seq ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			
			process.put("pl_seq", rs.getInt(1));
			process.put("pl_sender", rs.getString(2));
			process.put("pl_content", rs.getString(3));
			process.put("pl_file", rs.getString(4));
			process.put("sendtime", rs.getString(5));
			process.put("pl_check", rs.getInt(6));
			process.put("order_num", rs.getInt(7));
			process.put("t_request", rs.getString(8));
			
			proArr.add(process);
			}//모든 진행 완료후 뿌려줄때의 데이터
			
			//해당 별점 가져오기
			sql  =  " select distinct m.m_email buyer, e_star,e_content, to_char(e_date,'yy.mm.dd HH24:MI') e_date "; 
			sql +=	" from evaluation e join t_order od on e.order_num=od.order_num join payment p on p.p_seq=od.p_seq join payment_list pl on pl.p_seq=p.p_seq  join member m on p.m_email=m.m_email ";
			sql += " where e.order_num=? ";
			 
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				evaluation.put("buyer", rs.getString(1));
				evaluation.put("e_star", rs.getDouble(2));
				evaluation.put("e_content", rs.getString(3));
				evaluation.put("e_date", rs.getString(4));
				
				evalArr.add(evaluation);
			
			}//평가 데이터
			
			sql = " select p.order_num, pr_seq, pr_solution, s.s_num, solution, sp.sp_num, sp_content from problum p join solution s on p.s_num=s.s_num join speculation sp on sp.sp_num=s.sp_num ";
			sql += " where p.order_num=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				solution.put("order_num", rs.getInt(1));
				solution.put("pr_seq", rs.getInt(2));
				solution.put("pr_solution", rs.getString(3));
				solution.put("s_num", rs.getInt(4));
				solution.put("solution", rs.getString(5));
				solution.put("sp_num", rs.getInt(6));
				solution.put("sp_content", rs.getString(7));
				
				solArr.add(solution);
			
			}//문제 해결 요청 데이터
			
			sql = " select distinct mr_seq "; 
			sql += " from t_order od join payment p on od.p_seq=p.p_seq join payment_list pl on pl.p_seq=p.p_seq join msg_relation ms on ms.buy_email=p.m_email and ms.t_seq=pl.t_seq "; 
			sql += " where od.order_num=? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				message.put("mr_seq", rs.getInt(1));
				
				msgArr.add(message);
			
			}//해당 메세지관계번호 가져오기
			
			sql = " select to_char(sp_num) sp_num, sp_content from speculation ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				error.put("sp_num", rs.getString(1));
				error.put("sp_content", rs.getString(2));
				errArr.add(error);
			}//문제 해결요총
			
			sql = "select * from add_payment where order_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				addpay.put("ap_term", rs.getInt(1));
				addpay.put("ap_price", rs.getInt(2));
				addpay.put("ap_ck", rs.getInt(3));
				
				addArr.add(addpay);
			}//추가 결제 정보
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
		
		request.setAttribute("ordernum", order);
		request.setAttribute("evaluation", evalArr);
		request.setAttribute("email", email);
		request.setAttribute("payment", payArr);
		request.setAttribute("time", timeArr);
		request.setAttribute("notice", notArr);
		request.setAttribute("process", proArr);
		request.setAttribute("solution", solArr);
		request.setAttribute("message", msgArr);
		request.setAttribute("error", errArr);
		request.setAttribute("addpay", addArr);
		
		return "/WEB-INF/view/management/management.jsp";
	}

}
