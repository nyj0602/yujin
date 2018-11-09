package payment;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import com.util.ConnectionProvider;

import command.CommandHandler;

public class PaymentEndHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String p_seq = request.getParameter("p_seq"); // 결제번호
		String p_price = request.getParameter("p_price"); // 가격
		String p_how = request.getParameter("p_how"); // 결제방법
		String p_sep = request.getParameter("p_sep"); // 결제구분
		String m_email = request.getParameter("m_email"); // 이메일
		String t_seq = request.getParameter("t_seq"); // 재능번호
		String ps_state = request.getParameter("ps_state"); // 결제상태
		String profit = request.getParameter("profit"); //수익금
		String ordernum = request.getParameter("ordernum"); //주문번호
		String [] op_seq = request.getParameterValues("op_seq");

		// 결제테이블
		
		Connection conn = null;
		
		try {
			String sql = "insert into payment (p_seq,p_price,p_term,p_how,p_sep,m_email) values (?,?,to_number(to_char(sysdate,'YYYYMMDDhh24mi')),?,?,?)";
			conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, p_seq);
			pstmt.setString(2, p_price);
			pstmt.setString(3, p_how);
			pstmt.setString(4, p_sep);
			pstmt.setString(5, m_email);

			pstmt.executeUpdate();

			// 결제목록
			for (int i = 0; i < op_seq.length; i++) {
				sql = "insert into payment_list (pl_seq,t_seq,op_seq,p_seq) values (payment_listSEQ.nextval,?,?,?)";
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, t_seq);
				pstmt.setString(2, op_seq[i]);
				pstmt.setString(3, p_seq);

				pstmt.executeUpdate();
			}
			

			// 결제상태테이블
			sql = "insert into payment_state (ps_seq,ps_state,ps_date,p_seq) values (payment_stateSEQ.nextval,?,to_date(sysdate,'YY/MM/DD'),?)";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, ps_state);
			pstmt.setString(2, p_seq);

			pstmt.executeUpdate();

			// 결제완료테이블
			sql = "insert into payment_done (p_seq,pd_date) values (?,to_date(sysdate,'YY/MM/DD'))";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, p_seq);

			pstmt.executeUpdate();

			// 캐시사용.
			sql = "insert into cash_use (p_seq,cu_deduction) values(?,?)";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, p_seq);
			pstmt.setString(2, p_price);
			
			pstmt.executeUpdate();
			
			// 캐시내역 - 크몽캐시 구매
			sql = "insert into cash_list (cl_seq,cl_state,cl_price,cl_date,m_email,cl_sep,p_seq) values (cash_listSEQ.nextval,?,?,to_date(sysdate,'YY/MM/DD'),?,?,?)";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "크몽캐시 구매");
			pstmt.setString(2, p_price);
			pstmt.setString(3, m_email);
			pstmt.setString(4, "충전");
			pstmt.setString(5, p_seq);
			
			pstmt.executeUpdate();
			
			// 캐시내역 - 서비스 구매
			sql = "insert into cash_list (cl_seq,cl_state,cl_price,cl_date,m_email,cl_sep,p_seq) values (cash_listSEQ.nextval,?,?,to_date(sysdate,'YY/MM/DD'),?,?,?)";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, "서비스 구매");
			pstmt.setString(2, p_price);
			pstmt.setString(3, m_email);
			pstmt.setString(4, "사용");
			pstmt.setString(5, p_seq);
			
			pstmt.executeUpdate();
			
			// 주문테이블
			sql = "insert into t_order (order_num,p_seq) values(?,?)";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ordernum);
			pstmt.setString(2, p_seq);
			
			pstmt.executeUpdate();

			//수익금테이블
			sql = "insert into profits (pf_seq,order_num,pf_price,pf_sep,pf_date) values(Profits_SEQ.nextval,?,?,?,to_date(sysdate,'YY/MM/DD'))";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ordernum);
			pstmt.setString(2, profit);
			pstmt.setString(3, "예상");
			

			pstmt.executeUpdate();
			
			String Success = "성공";
			
			request.setAttribute("Success", Success);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
		
		return "/WEB-INF/view/order/order_blank.jsp";
	}

}
