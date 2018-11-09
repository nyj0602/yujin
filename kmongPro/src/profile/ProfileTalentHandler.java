package profile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import com.util.ConnectionProvider;

import command.CommandHandler;
import dto.HeartDTO;
import dto.StarDTO;
import dto.TalentDTO;

public class ProfileTalentHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		String sellerID = request.getParameter("sellerID");
		String sessionID = request.getParameter("sessionID");
		ArrayList<TalentDTO> talent = new ArrayList<>();
		Connection conn = null;
		try {
			// 재능명, 최저가격 가져오기
			String sql = "select * from (select distinct t_seq,m_email,t_name from talent) A left outer join (select distinct t_seq,op_price,op_sep from t_option) B on A.t_seq = b.t_seq left outer join (select t_seq,min(image),min(i_seq) as i_seq from image group by t_seq) C on B.t_seq = C.t_seq where m_email= ? and OP_SEP = 'standard' order by A.t_seq";
			conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sellerID);
			ResultSet rs = pstmt.executeQuery();

			String op_price;
			String t_name = null;
			String t_seq = null;
			String m_email = null;
			String image = null;

			while (rs.next()) {
				TalentDTO dto = new TalentDTO();
				t_name = rs.getString(3);
				op_price = rs.getString(5);
				t_seq = rs.getString(1);
				m_email = rs.getString(2);
				image = rs.getString(8);
				dto.setOp_price(op_price);
				dto.sett_seq(t_seq);
				dto.sett_name(t_name);
				dto.setM_email(m_email);
				dto.setImage(image);
				System.out.println(t_name);
				System.out.println(image);
				talent.add(dto);
			}

			request.setAttribute("talent", talent);
			// 재능찜목록여부
			// sql = "select * from (select distinct t_seq from t_option) B left outer join
			// (select m_email, t_seq from heart) C on b.t_seq = c.t_seq where m_email = ?";
			sql = "select * from heart where m_email = ?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sessionID);
			rs = pstmt.executeQuery();
			t_seq = null;

			ArrayList<HeartDTO> heart = new ArrayList<>();

			while (rs.next()) {
				HeartDTO dto = new HeartDTO();
				t_seq = rs.getString(2);
				System.out.println(t_seq);
				dto.sett_seq(t_seq);
				heart.add(dto);
			}

			request.setAttribute("heart", heart);

			// 회원구분
			sql = "select m_sep from member where m_email=?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sellerID);
			rs = pstmt.executeQuery();

			System.out.println(sellerID);
			String m_sep = null;
			while (rs.next()) {
				m_sep = rs.getString(1);
			}

			m_sep = m_sep.substring(0, 2);

			request.setAttribute("m_sep", m_sep);

			// 회원닉네임
			sql = "select m_name from member where m_email = ?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sellerID);
			rs = pstmt.executeQuery();
			String nickname = null;
			while (rs.next()) {
				nickname = rs.getString(1);
			}

			request.setAttribute("nickname", nickname);

			// 별점 평균
			sql = " select t_seq, avg(e_star) avg, count(t_seq) num from ( select pl.t_seq, e_star, rank() over (partition by t_seq order by op_seq) rank "
					+ " from evaluation e join t_order od on e.order_num=od.order_num"
					+ " join payment p on p.p_seq=od.p_seq join payment_list pl on pl.p_seq=p.p_seq where p.p_sep='서비스 구매') where rank=1 group by t_seq";
			conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			ArrayList<StarDTO> star = new ArrayList<>();

			while (rs.next()) {
				StarDTO dto = new StarDTO();
				t_seq = rs.getString(1);
				String avg = rs.getString(2);
				String num = rs.getString(3);

				dto.sett_seq(t_seq);
				dto.setavg(avg);
				dto.setnum(num);

				star.add(dto);
			}
			request.setAttribute("star", star);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}

		return "/WEB-INF/view/profile/profile_talent.jsp";
	}

}
