package payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import command.CommandHandler;
import dto.OptionDTO;

public class PaymentHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] op_seq = request.getParameterValues("op_seq");
		String sessionID = (String) request.getSession().getAttribute("authUser");
		request.setAttribute("op_seq", op_seq);
		
		
		if (sessionID == null) {

			return "/WEB-INF/view/login/login.jsp";
		} else {
			for (int i = 0; i < op_seq.length; i++) {
				System.out.println("op_seq : " + op_seq[i]);
			}
			String t_name = request.getParameter("t_name");// 재능제목
			String t_seq = request.getParameter("t_seq");// 재능번호
			String image = request.getParameter("image");// 재능이미지파일명
			String m_name = request.getParameter("m_name"); // 재능판매자닉네임

			Connection conn = null;
			ArrayList<OptionDTO> OptionValue = new ArrayList<>();
			ArrayList<OptionDTO> OptionValue2 = new ArrayList<>();
			
			
			
			try {
				for (int i = 0; i < op_seq.length; i++) {
					String sql = "select op_sep,op_price,op_term,op_change,op_manual1,op_manual2 from t_option  where op_seq="
							+ op_seq[i] + " and t_seq =" + t_seq;
					conn = ConnectionProvider.getConnection();
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					// T_SEQ / OP_SEQ / OP_SEP / OP_PRICE / OP_TERM / OP_CHANGE/
					// OP_MANUAL1/OP_MANUAL2

					String op_sep = null;
					String op_price = null;
					String op_term = null;
					String op_change = null;
					String op_manual1 = null;
					String op_manual2 = null;
					String[] abc;
					while (rs.next()) {
						OptionDTO dto = new OptionDTO();

						op_sep = rs.getString(1);
						op_price = rs.getString(2);
						op_term = rs.getString(3);
						op_change = rs.getString(4);
						op_manual1 = rs.getString(5);
						op_manual2 = rs.getString(6);
						dto.setOp_sep(op_sep);
						dto.setOp_price(op_price);
						dto.setOp_term(op_term);
						dto.setOp_change(op_change);
						dto.setOp_manual1(op_manual1);
						dto.setOp_manual2(op_manual2);

						OptionValue.add(dto);

					}

				}

				request.setAttribute("OptionValue", OptionValue);

				String sql = "select t_seq,op_seq,op_sep,op_price,op_term,op_change,op_manual1,op_manual2 from t_option  where  t_seq = "
						+ t_seq
						+ " and op_sep != 'standard' and op_sep != 'deluxe' and op_sep != 'premium' and op_sep != '추가옵션' ";

				conn = ConnectionProvider.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);

				String op_sep = null;

				String op_price = null;
				String op_term = null;
				String op_change = null;
				String op_manual1 = null;
				String op_manual2 = null;

				while (rs.next()) {
					OptionDTO dtos = new OptionDTO();

					op_sep = rs.getString(3);
					op_price = rs.getString(4);
					op_term = rs.getString(5);
					op_change = rs.getString(6);
					op_manual1 = rs.getString(7);
					op_manual2 = rs.getString(8);

					dtos.setOp_sep(op_sep);
					dtos.setOp_price(op_price);
					dtos.setOp_term(op_term);
					dtos.setOp_change(op_change);
					dtos.setOp_manual1(op_manual1);
					dtos.setOp_manual2(op_manual2);

					OptionValue2.add(dtos);
				}

				request.setAttribute("OptionValue2", OptionValue2);
				request.setAttribute("sessionID", sessionID);

				sql = "select cc_money from charge_cash where m_email = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, sessionID);
				rs = pstmt.executeQuery();

				String cc_money = null;
				while (rs.next()) {

					cc_money = rs.getString(1);
				}

				if (cc_money == null) {
					cc_money = "0";
				}

				request.setAttribute("cc_money", cc_money);
				request.setAttribute("t_name", t_name);
				request.setAttribute("t_seq", t_seq);
				request.setAttribute("image", image);
				request.setAttribute("m_name", m_name);

				sql = "select m_sep from member where m_email = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, sessionID);
				rs = pstmt.executeQuery();
				String m_sep = null;

				while (rs.next()) {

					m_sep = rs.getString(1);
				}
				
				m_sep = m_sep.substring(0, 2);
				if(m_sep.equals("개인")) {
					sql = "select pm_name,pm_phone from per_member where m_email = ? ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					rs = pstmt.executeQuery();
					
					String pm_name = null;
					String pm_phone = null;
					
					while(rs.next()) {
						pm_name =rs.getString(1);
						pm_phone = rs.getString(2);
					}
					request.setAttribute("pm_name", pm_name);
					request.setAttribute("pm_phone", pm_phone);
					
					conn.close();
					
				}else {
					sql = "select cm_name,cm_phone from com_member where m_email = ? ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);
					rs = pstmt.executeQuery();
					
					String cm_name = null;
					String cm_phone = null;
					
					while(rs.next()) {
						cm_name =rs.getString(1);
						cm_phone = rs.getString(2);
					}
					request.setAttribute("cm_name", cm_name);
					request.setAttribute("cm_phone", cm_phone);
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn);
			}
			
			

			

			return "/WEB-INF/view/order/order.jsp";
		}

	}

}
