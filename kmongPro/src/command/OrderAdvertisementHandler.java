package command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import category.CategoryDTO;
import service.AdvertiseInfo;
import service.CategoryHeader;
import service.HeartInfo;
import service.HeartService;
import service.MasterMileageService;
import service.MyServiceName;
import service.TotalHaveCash;

public class OrderAdvertisementHandler implements CommandHandler {

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
		
		request.setAttribute("m_profile", m_profile);
		request.setAttribute("m_name", m_name);
		request.setAttribute("m_profile", m_profile);
		request.setAttribute("m_name", m_name);

		CategoryHeader categoryHeader = new CategoryHeader();
		ArrayList<CategoryDTO> categoryList = categoryHeader.getCategory(conn);
		request.setAttribute("categoryList", categoryList);

		MyServiceName myServiceName = new MyServiceName();
		ArrayList<AdvertiseInfo> myServiceNameList = new ArrayList<>();
		myServiceNameList = myServiceName.serviceList(conn, m_email);
		request.setAttribute("myServiceNameList", myServiceNameList);

		TotalHaveCash totalHaveCash = new TotalHaveCash();
		int haveCash = totalHaveCash.calTotalHaveCash(conn, m_email);

		request.setAttribute("haveCash", haveCash);

		MasterMileageService masterMileageService = new MasterMileageService();
		int masterMileage = masterMileageService.selectMileage(conn, m_email);
		request.setAttribute("masterMileage", masterMileage);

		HeartService heartService = new HeartService();
		ArrayList<HeartInfo> heartInfoList = new ArrayList<>();
		heartInfoList = heartService.getHeartInfo(conn, m_email);
		request.setAttribute("heartInfoList", heartInfoList);

		return "/WEB-INF/view/seller/order_advertisement_gig.jsp";
	}

}
