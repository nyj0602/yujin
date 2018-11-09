package profile;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import com.util.ConnectionProvider;

import command.CommandHandler;
import dto.HeartDTO;
import net.sf.json.JSONObject;

public class EditMyInfomationHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String sessionID = (String) request.getSession().getAttribute("authUser");
		String textarea = request.getParameter("textarea");
		String summaryText = request.getParameter("summaryText");
		String carrerInput = request.getParameter("carrerInput");
		String afterCareerName = request.getParameter("beforeInsertValue");
		String licenseName = request.getParameter("licenseName");
		String beforeInputLicense = request.getParameter("beforeInputLicense");
		String deletelicenseName = request.getParameter("licenseNamess");
		String deleteCareerName = request.getParameter("CareerNamess");
		String changeNickname = request.getParameter("changeNickname");
		String StartTime = request.getParameter("StartTime");
		String EndTime = request.getParameter("EndTime");
		String newPhonenum =request.getParameter("newPhonenum");
		

		String choiceTalent = request.getParameter("choiceTalent");

		String Success = null;
		Connection conn = null;
		
		
		try {
			if (textarea != null) { // 소개수정시에
				String sql = "update member set m_intros = ? where m_email = ? ";
				 conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, textarea);
				pstmt.setString(2, sessionID);
				int SorF = pstmt.executeUpdate();

				if (SorF == 0) { // 실패
					Success = "실패";
				} else { // 성공
					Success = "성공";
				}
				request.setAttribute("Success", Success);
				return "/WEB-INF/view/profile/profile_Edit.jsp";

			}

			else if (summaryText != null) { // 한줄소개수정시에
				String sql = "update member set m_intro = ? where m_email = ? ";
				conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, summaryText);
				pstmt.setString(2, sessionID);

				int SorF = pstmt.executeUpdate();

				if (SorF == 0) { // 실패
					Success = "실패";
				} else { // 성공
					Success = "성공";
				}
				request.setAttribute("Success", Success);
				return "/WEB-INF/view/profile/profile_Edit.jsp";
			}

			else if (carrerInput != null) {// 경력추가
				String carrerStart = request.getParameter("carrerStart");
				String carrerEnd = request.getParameter("carrerEnd");
				String sql = "insert into m_career values(m_careerSeq.nextval,?,?,?,?)";

				conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, carrerInput);
				pstmt.setString(2, carrerStart);
				pstmt.setString(3, carrerEnd);
				pstmt.setString(4, sessionID);

				int SorF = pstmt.executeUpdate();

				if (SorF == 0) { // 실패
					Success = "실패";
				} else { // 성공
					Success = "성공";
				}
				request.setAttribute("Success", Success);
				return "/WEB-INF/view/profile/profile_Edit.jsp";
			}

			else if (afterCareerName != null) {// 경력수정
				String beforeCareerName = request.getParameter("careerText");// 이전에입력되어있던 경력명
				String afterCareerStart = request.getParameter("beforeInsertValue2");
				String afterCareerEnd = request.getParameter("beforeInsertValue3");
				String sql = "update m_career set mc_content = ?, MC_START=?, mc_end=?  where mc_content = ?";
				conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, afterCareerName);
				pstmt.setString(2, afterCareerStart);
				pstmt.setString(3, afterCareerEnd);
				pstmt.setString(4, beforeCareerName);
				int SorF = pstmt.executeUpdate();

				if (SorF == 0) { // 실패
					Success = "실패";
				} else { // 성공
					Success = "성공";
				}
				System.out.println(Success);
				request.setAttribute("Success", Success);
				return "/WEB-INF/view/profile/profile_Edit.jsp";
			}

			else if (licenseName != null) { // 자격증추가
				String licenseDay = request.getParameter("licenseDay");
				String licenseCenter = request.getParameter("licenseCenter");
				String sql = "insert into m_license values(m_licenseSeq.nextval,?,?,?,?)";
				conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, licenseName);
				pstmt.setString(2, licenseDay);
				pstmt.setString(3, licenseCenter);
				pstmt.setString(4, sessionID);

				int SorF = pstmt.executeUpdate();

				if (SorF == 0) { // 실패
					Success = "실패";
				} else { // 성공
					Success = "성공";
				}
				System.out.println(Success);
				request.setAttribute("Success", Success);
				return "/WEB-INF/view/profile/profile_Edit.jsp";
			}

			else if (beforeInputLicense != null) { // 자격증수정
				String licenseNames = request.getParameter("licneseNames");
				String licenseDay = request.getParameter("licenseDay");
				String licenseCenter = request.getParameter("licenseCenter");
				String sql = "update m_license set ml_content = ?, ml_date= ?, ml_org= ?  where ml_content = ?";
				conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, licenseNames);
				pstmt.setString(2, licenseDay);
				pstmt.setString(3, licenseCenter);
				pstmt.setString(4, beforeInputLicense);
				System.out.println("---------------");
				System.out.println(licenseNames);
				System.out.println(licenseDay);
				System.out.println(licenseCenter);
				System.out.println(beforeInputLicense);
				System.out.println("---------------");
				int SorF = pstmt.executeUpdate();

				if (SorF == 0) { // 실패
					Success = "실패";
				} else { // 성공
					Success = "성공";
				}
				System.out.println(Success);
				request.setAttribute("Success", Success);
				return "/WEB-INF/view/profile/profile_Edit.jsp";
			}

			else if (deletelicenseName != null) {// 자격증삭제
				String sql = "delete from m_license where ml_content = ? and m_email = ?";
				conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, deletelicenseName);
				pstmt.setString(2, sessionID);

				int SorF = pstmt.executeUpdate();

				if (SorF == 0) { // 실패
					Success = "실패";
				} else { // 성공
					Success = "성공";
				}
				System.out.println(Success);
				request.setAttribute("Success", Success);
				return "/WEB-INF/view/profile/profile_Edit.jsp";
			}

			else if (deleteCareerName != null) {// 경력삭제
				String sql = "delete from m_career where mc_content = ? and m_email = ?";
				conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, deleteCareerName);
				pstmt.setString(2, sessionID);

				int SorF = pstmt.executeUpdate();

				if (SorF == 0) { // 실패
					Success = "실패";
				} else { // 성공
					Success = "성공";
				}
				System.out.println(Success);
				request.setAttribute("Success", Success);
				return "/WEB-INF/view/profile/profile_Edit.jsp";
			} else if (choiceTalent != null) {
				// 찜목록추가

				String sql = "insert into heart values(?,?)";
				conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);

				String m_email = request.getParameter("m_email");

				pstmt.setString(1, sessionID);
				pstmt.setString(2, choiceTalent);
				try {

					int SorF = pstmt.executeUpdate();

					if (SorF == 0) { // 실패
						Success = "실패";
					} else { // 성공
						Success = "성공";
					}
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/profile/profile_Edit.jsp";
				} catch (SQLException e) {
					String t_seq = request.getParameter("t_seq");
					sql = "delete from heart where m_email = ? and t_seq = ?";
					conn = ConnectionProvider.getConnection();
					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, sessionID);
					pstmt.setString(2, t_seq);
					pstmt.executeUpdate();

					Success = "찜목록삭제";
					request.setAttribute("Success", Success);
					return "/WEB-INF/view/profile/profile_Edit.jsp";
				}
			} else if (changeNickname != null) {
				String sql = "update member set m_name = ? where m_email = ?";
				conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, changeNickname);
				pstmt.setString(2, sessionID);

				int SorF = pstmt.executeUpdate();

				if (SorF == 0) { // 실패
					Success = "실패";
				} else { // 성공
					Success = "성공";
				}

				sql = "select m_sep from member where m_email = ?";
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, sessionID);
				ResultSet rs = pstmt.executeQuery();
				String division = null;

				while (rs.next()) {
					division = rs.getString(1);
				}

				division = division.substring(0, 2);

				if (division.equals("기업")) {
					sql = "update com_member set cm_nchange = 1 where m_email = ?";
					conn = ConnectionProvider.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);

					pstmt.executeUpdate();

				} else {
					sql = "update per_member set pm_nchange = 1 where m_email = ?";
					conn = ConnectionProvider.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, sessionID);

					pstmt.executeUpdate();
				}

				request.setAttribute("Success", Success);
				return "/WEB-INF/view/profile/profile_Edit.jsp";

			}else if(StartTime != null && EndTime != null) {

				String sql = "select m_sep from member where m_email = ?";
				conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, sessionID);
				ResultSet rs = pstmt.executeQuery();
				String division = null;

				while (rs.next()) {
					division = rs.getString(1);
				}

				division = division.substring(0, 2);

				if (division.equals("기업")) {
					sql = "update com_member set cm_call_1 = ? , cm_call_2=? where m_email = ?";
					conn = ConnectionProvider.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, StartTime);
					pstmt.setString(2, EndTime);
					pstmt.setString(3, sessionID);

					int SorF = pstmt.executeUpdate();
					
					if (SorF == 0) { // 실패
						Success = "실패";
					} else { // 성공
						Success = "성공";
					}

					request.setAttribute("Success", Success);
					return "/WEB-INF/view/profile/profile_Edit.jsp";
				} else {
					sql = "update per_member set pm_call_1 = ? , pm_call_2=? where m_email = ?";
					conn = ConnectionProvider.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, StartTime);
					pstmt.setString(2, EndTime);
					pstmt.setString(3, sessionID);

					int SorF = pstmt.executeUpdate();
					
					if (SorF == 0) { // 실패
						Success = "실패";
					} else { // 성공
						Success = "성공";
					}

					request.setAttribute("Success", Success);
					return "/WEB-INF/view/profile/profile_Edit.jsp";
				}

			}else if(newPhonenum!=null) {
				String sql = "select m_sep from member where m_email = ?";
				conn = ConnectionProvider.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, sessionID);
				ResultSet rs = pstmt.executeQuery();
				String division = null;

				while (rs.next()) {
					division = rs.getString(1);
				}

				division = division.substring(0, 2);

				if (division.equals("기업")) {
					sql = "update com_member set cm_phone=? where m_email = ?";
					conn = ConnectionProvider.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, newPhonenum);
					pstmt.setString(2, sessionID);

					int SorF = pstmt.executeUpdate();
					
					if (SorF == 0) { // 실패
						Success = "실패";
					} else { // 성공
						Success = "성공";
					}

					request.setAttribute("Success", Success);
					return "/WEB-INF/view/profile/profile_Edit.jsp";
				} else {
					sql = "update per_member set pm_phone=? where m_email = ?";
					conn = ConnectionProvider.getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, newPhonenum);
					pstmt.setString(2, sessionID);

					int SorF = pstmt.executeUpdate();
					
					if (SorF == 0) { // 실패
						Success = "실패";
					} else { // 성공
						Success = "성공";
					}

					request.setAttribute("Success", Success);
					return "/WEB-INF/view/profile/profile_Edit.jsp";
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
