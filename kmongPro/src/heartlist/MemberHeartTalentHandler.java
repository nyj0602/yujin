package heartlist;

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
import dto.MemberDTO;
import dto.StarDTO;
import dto.TalentDTO;

public class MemberHeartTalentHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		String sessionID = request.getParameter("sessionID");
		String sql = "select * from (select t_seq,m_email from heart) A left outer join (select t_seq,m_email from talent) B on A.t_seq = B.t_seq where a.m_email = ?";
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<String> Hearttalents = new ArrayList<>();
		ArrayList<String> HearttalentSEQ = new ArrayList<>();

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sessionID);
			rs = pstmt.executeQuery();

			String email = null;
			// ArrayList<TalentDTO> talents = new ArrayList<>();
			String talentID = null;
			String talentSEQ = null;
			while (rs.next()) {
				talentID = rs.getString(4); // 찜목록누른 재능 판매자 email들
				talentSEQ = rs.getString(3);

				Hearttalents.add(talentID);
				HearttalentSEQ.add(talentSEQ);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}

		// 재능명, 최저가격 가져오기

		ArrayList<TalentDTO> talent = new ArrayList<>();
		try {
			for (int i = 0; i < Hearttalents.size(); i++) {
				System.out.println(i + "번쨰아이디" + Hearttalents.get(i));
				System.out.println(i + "번쨰재능" + HearttalentSEQ.get(i));
				sql = "select * from (select m_email,m_sep,m_name from member) D left outer join (select t_seq,m_email,t_name from talent) A on D.m_email = A.m_email left outer join (select t_seq,op_price,op_sep from t_option) B on A.t_seq = b.t_seq left outer join(select c_id,t_seq from cat_arrange) C on C.t_seq = A.t_seq left outer join (select t_seq,min(image),min(i_seq) as i_seq from image group by t_seq) D on A.t_seq = D.t_seq where A.m_email= ? and OP_SEP = 'standard' and A.T_SEQ = ? and C.c_id <= 119 order by A.t_seq";
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, Hearttalents.get(i));
				pstmt.setString(2, HearttalentSEQ.get(i));

				rs = pstmt.executeQuery();

				String op_price;
				String t_name = null;
				String t_seq = null;
				String m_email = null;
				String m_sep = null;
				String m_name = null;
				String c_id = null;
				String image = null;
				while (rs.next()) {
					TalentDTO dto = new TalentDTO();
					t_name = rs.getString(6);
					op_price = rs.getString(8);
					t_seq = rs.getString(4);
					m_email = rs.getString(1);
					m_name = rs.getString(3);
					m_sep = rs.getString(2);
					m_sep = m_sep.substring(0, 2);
					c_id = rs.getString(10);
					image = rs.getString(13);
					dto.setOp_price(op_price);
					dto.sett_seq(t_seq);
					dto.setM_name(m_name);
					dto.sett_name(t_name);
					dto.setM_email(m_email);
					dto.setm_sep(m_sep);
					dto.setC_id(c_id);
					dto.setImage(image);
					talent.add(dto);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}

		request.setAttribute("talent", talent);

		// 재능찜목록여부
		// sql = "select * from (select distinct t_seq from t_option) B left outer join
		// (select m_email, t_seq from heart) C on b.t_seq = c.t_seq where m_email = ?";

		ArrayList<HeartDTO> heart = new ArrayList<>();
		String t_seq = null;
		try {

			sql = "select * from heart where m_email = ?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sessionID);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				HeartDTO dto = new HeartDTO();
				t_seq = rs.getString(2);
				System.out.println("찜목록" + t_seq);
				dto.sett_seq(t_seq);
				heart.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}

		request.setAttribute("heart", heart);

		ArrayList<StarDTO> star = new ArrayList<>();
		// 별점 평균

		try {
			for (int i = 0; i < HearttalentSEQ.size(); i++) {
				sql = " select t_seq, avg(e_star) avg, count(t_seq) num from ( select pl.t_seq, e_star, rank() over (partition by t_seq order by op_seq) rank "
						+ " from evaluation e join t_order od on e.order_num=od.order_num"
						+ " join payment p on p.p_seq=od.p_seq join payment_list pl on pl.p_seq=p.p_seq where p.p_sep='서비스 구매') where rank=1 and t_seq= ? group by t_seq";
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				System.out.println(HearttalentSEQ.get(i));
				pstmt.setString(1, HearttalentSEQ.get(i));
				rs = pstmt.executeQuery();

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
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		request.setAttribute("star", star);

		return "/WEB-INF/view/member/memberHeart_talent.jsp";
	}

}