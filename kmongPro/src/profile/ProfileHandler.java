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
import dto.CareerDTO;
import dto.GradeDTO;
import dto.LicenseDTO;

public class ProfileHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String sellerID = request.getParameter("sellerID");// 보고자하는 프로필 아이디
		String sessionID = (String) request.getSession().getAttribute("authUser"); // 로그인된아이디
		String type = request.getParameter("type");
		Connection conn = null;
		
		
		try {
			// 닉네임,한줄소개,소개
			String sql = "select m_name, m_intro,m_intros from member where m_email = ?";
			conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sellerID);
			ResultSet rs = pstmt.executeQuery();
			String nickname = null;
			String intro = null;
			String intros = null;
			while (rs.next()) {
				nickname = rs.getString(1);
				intro = rs.getString(2);
				intros = rs.getString(3);
			}
			if (intro == null) {
				intro = "한 줄 소개를 작성해주세요";
			} else if (intros == null) {
				intros = "소개를 작성해주세요.";
			}

			request.setAttribute("sellerID", sellerID);
			request.setAttribute("nickname", nickname);
			request.setAttribute("intro", intro);
			request.setAttribute("intros", intros);

			// 경력사항
			sql = "select mc_content, mc_start, mc_end from M_CAREER where m_email = ?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			ArrayList<CareerDTO> m_career = new ArrayList<>();

			pstmt.setString(1, sellerID);
			rs = pstmt.executeQuery();
			String mc_content = null;
			String mc_start = null;
			String mc_end = null;

			while (rs.next()) {
				CareerDTO dto = new CareerDTO();
				mc_content = rs.getString(1);
				mc_start = rs.getString(2);
				mc_end = rs.getString(3);

				dto.setMc_content(mc_content);
				dto.setMc_start(mc_start);
				dto.setMc_end(mc_end);

				m_career.add(dto);

			}
			request.setAttribute("m_career", m_career);

			// 자격증

			sql = "select ml_content,ml_date,ml_org from m_license where m_email = ?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sellerID);
			rs = pstmt.executeQuery();
			String ml_content = null;
			String ml_date = null;
			String ml_org = null;

			ArrayList<LicenseDTO> m_license = new ArrayList<>();

			while (rs.next()) {
				LicenseDTO dto = new LicenseDTO();
				ml_content = rs.getString(1);
				ml_date = rs.getString(2);
				ml_org = rs.getString(3);
				dto.setMl_content(ml_content);
				dto.setMl_date(ml_date);
				dto.setMl_org(ml_org);

				m_license.add(dto);

			}
			request.setAttribute("m_license", m_license);

			// 전문가등급이미지

			// 1 new
			// 2 junior
			// 3 senior
			// 4 semipro
			// 5 pro
			// 6 master

			sql = "select GS_SEQ from grade where m_email = ?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sellerID);
			rs = pstmt.executeQuery();

			String grade = null;

			while (rs.next()) {
				GradeDTO dto = new GradeDTO();
				grade = rs.getString(1);

			}
			request.setAttribute("grade", grade);

			// 재능등록여부확인

			sql = "select t_seq from talent where m_email = ?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, sellerID);
			rs = pstmt.executeQuery();
			String talentOX = null;

			while (rs.next()) {
				talentOX = rs.getString(1);
			}
			if (talentOX == null) {
				talentOX = "1";
				request.setAttribute("talentOX", talentOX);
			} else {
				talentOX = "0";
				request.setAttribute("talentOX", talentOX);
			}
			
			
			

			//값에 따라 페이지이동
			if (sessionID == null) {
				request.setAttribute("sessionID", sessionID);
				return "/WEB-INF/view/profile/profile_other.jsp";
			}

			else if (type != null) {
				if (type.equals("seller")) {
					request.setAttribute("sessionID", sessionID);
					return "/WEB-INF/view/profile/profile_other.jsp";
				} else if (type.equals("buyer")) {
					request.setAttribute("sessionID", sessionID);
					return "/WEB-INF/view/profile/profile_myself.jsp";

				}
			} else {
				if (sessionID.equals(sellerID)) {
					request.setAttribute("sessionID", sessionID);
					return "/WEB-INF/view/profile/profile_myself.jsp";
				} else if (!sessionID.equals(sellerID)) {
					request.setAttribute("sessionID", sessionID);
					return "/WEB-INF/view/profile/profile_other.jsp";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
		
	
		return null;
	}
}
