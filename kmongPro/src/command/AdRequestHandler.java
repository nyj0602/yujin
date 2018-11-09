package command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import category.CategoryDAO;
import category.CategoryDTO;
import service.HeartInfo;
import service.HeartService;
import service.TotalHaveCash;

public class AdRequestHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = ConnectionProvider.getConnection();

		String m_email = (String) request.getSession().getAttribute("authUser");

		String sql = "select m_profile,m_name " + " from member" + " where m_email=? ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_email);
		rs = pstmt.executeQuery();

		String m_profile = null;
		String m_name = null;
		if (rs.next()) {

			m_profile = rs.getString(1);
			m_name = rs.getString(2);
		}
		;
		request.setAttribute("m_profile", m_profile);
		request.setAttribute("m_name", m_name);

		ArrayList<CategoryDTO> categoryList = new ArrayList<>();
		try {
			CategoryDAO categoryDAO = new CategoryDAO();

			categoryList = categoryDAO.selectAll_category(conn);
			request.setAttribute("categoryList", categoryList);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		HeartService heartService = new HeartService();
		ArrayList<HeartInfo> heartInfoList = new ArrayList<>();
		heartInfoList = heartService.getHeartInfo(conn, m_email);
		request.setAttribute("heartInfoList", heartInfoList);

		TotalHaveCash totalHaveCash = new TotalHaveCash();
		int haveCash = totalHaveCash.calTotalHaveCash(conn, m_email);

		request.setAttribute("haveCash", haveCash);

		return "/WEB-INF/view//ad_request/ad_request.jsp";
	}

}
