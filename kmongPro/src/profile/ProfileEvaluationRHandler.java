package profile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import command.CommandHandler;
import dto.EvaluationDTO;

public class ProfileEvaluationRHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 닉네임
		String nickname = request.getParameter("nickname");	
		String sellerID = request.getParameter("sellerID");
		String sessionID = request.getParameter("sessionID");
		request.setAttribute("nickname", nickname);
		
		Connection conn = null;
		
		
		
		try {
			// 평가목록
			String sql = "select * from (select order_num,e_star,e_content,e_date from evaluation ) A left outer join (select order_num,p_seq from t_order) B on a.order_num = b.order_num left outer join (select p_seq,m_email from payment) C on b.p_seq = c.p_seq left outer join (select distinct p_seq,t_seq from payment_list) D on c.p_seq = d.p_seq left outer join (select t_seq, m_email from talent) E on d.t_seq=e.t_seq where E.m_email=? ";
			
			conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ArrayList<EvaluationDTO> evaluation = new ArrayList<>();

			pstmt.setString(1, sellerID);
			ResultSet rs = pstmt.executeQuery();
			String sendm_email = null;
			String buyer = null;
			while (rs.next()) {
				EvaluationDTO dto = new EvaluationDTO();
				String order_num = rs.getString(1);
				String e_star = rs.getString(2);
				String e_content = rs.getString(3);
				String t_seq = rs.getString(10);
				buyer = rs.getString(8);
				String m_email = rs.getString(12);
				String t_date = rs.getString(4);
				sendm_email = m_email;
				dto.setorder_num(order_num);
				dto.sete_star(e_star);
				dto.sete_content(e_content);
				dto.sett_seq(t_seq);
				dto.setm_email(m_email);
				dto.sett_date(t_date);
				
				evaluation.add(dto);
			}		

			request.setAttribute("sendm_email", sendm_email);
			request.setAttribute("evaluation", evaluation);
			// 구매자닉네임
			sql = "select m_name from member where m_email = ?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, buyer);
			rs=pstmt.executeQuery();
			
			String buyerNickname=null;
			
			while(rs.next()) {
				buyerNickname = rs.getString(1);
			}
			
			request.setAttribute("buyerNickname", buyerNickname);
			
			
			// 회원총평점 및 평가 개수
			
			sql = "select avg(e_star),count(E.m_email) from (select order_num,e_star,e_content,e_date from evaluation ) A left outer join (select order_num,p_seq from t_order) B on a.order_num = b.order_num left outer join (select p_seq,m_email from payment) C on b.p_seq = c.p_seq left outer join (select distinct p_seq,t_seq from payment_list) D on c.p_seq = d.p_seq left outer join (select t_seq, m_email from talent) E on d.t_seq=e.t_seq where E.m_email= ? group by E.m_email";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sellerID);
			rs=pstmt.executeQuery();
			
			String CountEvaluation = null;
			String AvgEvaluation = null;
			while(rs.next()) {
				AvgEvaluation = rs.getString(1);
				CountEvaluation = rs.getString(2);
			}
			
			request.setAttribute("AvgEvaluation", AvgEvaluation);
			request.setAttribute("CountEvaluation", CountEvaluation);
					
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
		
		
		
		
	
		
		return "/WEB-INF/view/profile/profile_evaluation.jsp";
	}
	
}
