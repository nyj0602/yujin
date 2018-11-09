package message;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import oracle.net.aso.s;

public class MessageHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager .getConnection("jdbc:oracle:thin:@211.63.89.174:1521:xe", "kmong", "kmong");
		PreparedStatement  pstmt = null;
		//String [] datas = request.getParameter("me_seq").split("_");
		//String mr_seq =  datas[0];
		//String email = datas[1];
		String email =(String)request.getSession().getAttribute("authUser");  //세션에 저장된값 가져오기
		if (email==null) {
			return "/WEB-INF/view/login/login.jsp";
		}
		String sql = "";
		String t_seq = request.getParameter("t_seq");
		int mr_seq=Integer.parseInt(request.getParameter("mr_seq"));
		System.out.println(mr_seq);
		System.out.println(t_seq);
		//System.out.println(mr_seq);
		//System.out.println(email);
		JSONObject message = new JSONObject();	JSONArray msgArr = new JSONArray();
		JSONObject time = new JSONObject();	JSONArray timeArr = new JSONArray();
		JSONObject count = new JSONObject();	JSONArray countArr = new JSONArray();
		JSONObject talent = new JSONObject();	JSONArray talentArr = new JSONArray();
		JSONObject chat = new JSONObject();	JSONArray chatArr = new JSONArray();
		JSONObject seq = new JSONObject();
		ResultSet rs = null;
		try {
			//해당 구매자와 판매자에 관한 mr_seq가 없을경우 만들어서 msg_relation테이블에 추가하고 그에 해당하는 시퀀스값 가져와서 밑에 다른 쿼리들 수행
			if (mr_seq==0) {
				sql = " insert into msg_relation values(mr_seq.nextval,?,?,0,1,1) ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, t_seq);
				pstmt.setString(2, email);
				pstmt.executeUpdate();

				sql= " select mr_seq from msg_relation mr join talent t on mr.t_seq=t.t_seq ";
				sql += " where t.t_seq=? and buy_email like '"+email+"'";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, t_seq);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					seq.put("mr_seq", rs.getInt(1));
				}
				mr_seq= (int) seq.get("mr_seq");
				System.out.println("mrseq :" + mr_seq);
			}
			
			//클릭해서 메세지창을 보고있다는건 그전에 상대방이 보낸 메세지를 읽었다는 의미이므로 그에 해당하는 읽음 컬럼값 변경
			sql = " UPDATE message SET MSG_CK=1	WHERE MSG_SENDER not like '"+email+"' and mr_seq=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mr_seq);
			pstmt.executeUpdate();	
			
			sql = " select mr_seq, t.t_seq, ms.buy_email, mb.m_profile buyerprofile, t_name, t.m_email seller, ms.m_profile sellprofile, del_t, del_b  ";
			sql +=" from msg_relation ms join talent t on ms.t_seq=t.t_seq join member ms on ms.m_email=t.m_email join member mb on mb.m_email = ms.buy_email ";
			sql +=" where mr_seq = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mr_seq);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				
				message.put("mr_seq", rs.getInt(1));
				message.put("t_seq", rs.getInt(2));
				message.put("buy_email", rs.getString(3));
				message.put("buyerprofile", rs.getString(4));
				message.put("t_name", rs.getString(5));
				message.put("m_email", rs.getString(6));
				message.put("sellprofile", rs.getString(7));
				message.put("del_t", rs.getInt(8));
				message.put("del_b", rs.getInt(9));
			
				msgArr.add(message);
			}//메세지 창에 들어가는 정보
			
			//연락가능한시간
			sql = " select m_email email, cm_call_1 time_1, cm_call_2 time_2 from( ";
			sql += " select cm.m_email,cm_call_1 , cm_call_2 	from com_member cm ";
			sql += " union ";
			sql += " select pm.m_email, pm_call_1, pm_call_2	from per_member pm )   ";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
			time.put("email", rs.getString(1));
			time.put("time_1", rs.getInt(2));
			time.put("time_2", rs.getInt(3));
			
			timeArr.add(time);
			}//연락가능한시간
			
			//판매 또는구매 개수
			sql = " select t_seq, buyer, seller from ( select pl.t_seq, p.m_email buyer, t.m_email seller, rank() over (partition by pl.t_seq order by op_seq) rank ";
			sql += " from completed c join t_order od on c.order_num=od.order_num join payment p on p.p_seq=od.p_seq join payment_list pl on pl.p_seq=p.p_seq join talent t on pl.t_seq = t.t_seq ";
			sql += " where p_sep='서비스 구매' ) ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				count.put("t_seq", rs.getInt(1));
				count.put("buyer", rs.getString(2));
				count.put("seller", rs.getString(3));
			
			countArr.add(count);
			}//판매|구매개수
			
			//mr_seq에 해당하는 재능데이터 가져오기
			sql = " select t_seq,t_name,mr_seq,image from( ";
			sql += " select t.t_seq,t_name,mr_seq, image, rank() over (partition by i.t_seq order by i_seq) rank  ";
			sql += " from talent t join msg_relation ms on t.t_seq=ms.t_seq join image i on t.t_seq = i.t_seq) ";
			sql += " where rank=1 and mr_seq=? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mr_seq);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				talent.put("t_seq", rs.getInt(1));
				talent.put("t_name", rs.getString(2));
				talent.put("mr_seq", rs.getInt(3));
				talent.put("image", rs.getString(4));
			
			talentArr.add(talent);
			}//재능데이터
			
			//채팅내용가져오기
			sql = " select msg_seq,msg_content,to_char(msg_send,'yy.mm.dd HH24:MI') sendtime, msg_ck,msg_sender ";
			sql += " from message where mr_seq=? order by msg_seq ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mr_seq);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
			chat.put("msg_seq", rs.getInt(1));
			chat.put("msg_content", rs.getString(2));
			chat.put("sendtime", rs.getString(3));
			chat.put("msg_ck", rs.getInt(4));
			chat.put("msg_sender", rs.getString(5));
			
			chatArr.add(chat);
			}//채팅데이터
			
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
		
		request.getSession().setAttribute("sessionMr_seq", mr_seq); 
		request.setAttribute("chat", chatArr);
		request.setAttribute("mr_seq", mr_seq);
		request.setAttribute("talent", talentArr);
		request.setAttribute("count", countArr);
		request.setAttribute("time", timeArr);
		request.setAttribute("message", msgArr);
		request.setAttribute("email", email);
		
		return "/WEB-INF/view/message/message.jsp";
	}

}
